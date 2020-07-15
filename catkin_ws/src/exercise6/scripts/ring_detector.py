#!/usr/bin/env python
from __future__ import print_function

import sys
import rospy
import dlib
import cv2
import numpy as np
import tf2_geometry_msgs
import tf2_ros
import matplotlib.pyplot as plt
from sensor_msgs.msg import Image
from geometry_msgs.msg import PointStamped, Vector3, Pose
from cv_bridge import CvBridge, CvBridgeError
from visualization_msgs.msg import Marker, MarkerArray
from std_msgs.msg import ColorRGBA
from PIL import Image as Img
from color_recognition import get_colors
from nav_msgs.msg import Odometry
from tf.transformations import euler_from_quaternion
from geometry_msgs.msg import Twist
from std_msgs.msg import String
from geometry_msgs.msg import Vector3
from nav_msgs.msg import OccupancyGrid
from exercise6.msg import Ring




class ring_localizer:
    def image_callback(self, img):
        # rospy.loginfo("rgb received")

         self.rgb_image_message = img
    
    def depth_callback(self, depth):
        rospy.loginfo("depth received")
        self.depth_image_message = depth

    def point_callback(self, point):
        rospy.loginfo("transformed point received")
        self.transformed_point = point

            
    def __init__(self):
        rospy.init_node('ring_localizer', anonymous=True)

        self.rgb_image_message = None
        self.depth_image_message = None
        self.transformed_point = None
        self.infl_map = None
        self.resolution = 0.05

        # An object we use for converting images between ROS format and OpenCV format
        self.bridge = CvBridge()

        # A help variable for holding the dimensions of the image
        self.dims = (0, 0, 0)

        # Marker array object used for showing markers in Rviz
        self.marker_array = MarkerArray()
        self.marker_num = 1

        # Subscribe to the image and/or depth topic
        self.depth_sub = rospy.Subscriber("/camera/depth/image_raw", Image, callback=self.depth_callback)
        self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, callback=self.image_callback)
        self.transf_point_sub = rospy.Subscriber("transformed_map_point", Vector3, callback=self.point_callback)

        # Publiser for the visualization markers
        self.twist_pub = rospy.Publisher('twister', Twist, queue_size=10)
        self.extra_pub = rospy.Publisher('extra_pose', Vector3, queue_size=10)
        self.markers_pub = rospy.Publisher('ring_markers', MarkerArray, queue_size=1000)
        self.picture_pub = rospy.Publisher('ring_picture', Image, queue_size=1)
        self.picture2_pub = rospy.Publisher('ring_picture_rgb', Image, queue_size=1)
        self.wait_pub = rospy.Publisher('waiter', String, queue_size=10)
        self.pose_pub = rospy.Publisher('extra_pose', Vector3, queue_size=30)
        self.map_point_pub = rospy.Publisher('infl_map_point', Vector3, queue_size=10)
        self.ring_pub = rospy.Publisher('rings_pos', Ring, queue_size=10)

        # Object we use for transforming between coordinate frames
        self.tf_buf = tf2_ros.Buffer()
        self.tf_listener = tf2_ros.TransformListener(self.tf_buf)

        self.ring_positions = {}
        self.object_approach_locations = {}

    def remove_outlier(self, color):
        print('removing outliers')
        amount = len(self.ring_positions[color]) / 2
        #remove 100 outliers from 200 points
        values = self.ring_positions[color]
        center = np.mean(values, axis=0)
        diff = np.linalg.norm((center - values), axis=1)
        for i in range(amount):
            idx = np.argmax(diff)
            self.ring_positions[color].pop(idx)
            diff = np.delete(diff, idx)


    def get_angle_to_ring(self, coords, dist, stamp):
        k_f = 554
        x1,x2,y1,y2 = coords
        ring_x = self.dims[1] / 2 - (x1+x2)/2.
        ring_y = self.dims[0] / 2 - (y1+y2)/2.
        angle_to_target = np.arctan2(ring_x,k_f)
        return angle_to_target

    def find_nearest_white(self, pose):
        try:
            global_map = rospy.wait_for_message("/move_base/global_costmap/costmap", OccupancyGrid)
            a = np.array(global_map.data)
            a[a==-1] = 255
            a = 255 - a
            a[a<200] = 0
            a = np.array(a, dtype=np.uint8)
            a = np.resize(a, (512, 480))
            a = np.flip(a, axis=0)
            # cv2.imshow("name", a)
            # cv2.waitKey(0)
        except Exception as e:
            print(e, 'WRONGGG') 
            return 0
        #convert to pixels
        x = pose[0]
        y = pose[1]
        px, py = (int((x + 12.2)*20), int(512 - y*20 - 12.2*20))
        nonzero = cv2.findNonZero(a)
        distances = np.sqrt((nonzero[:,:,0] - px) ** 2 + (nonzero[:,:,1] - py) ** 2)
        nearest_index = np.argmin(distances)
        #convert to map frame
        nearest_idx = nonzero[nearest_index]
        map_x = nearest_idx[0][0]*0.05 - 12.2
        map_y = (512-nearest_idx[0][1])*0.05 - 12.2
        angle = np.arctan2(y-map_y,x-map_x)
        return map_x, map_y, angle


    def get_pose(self,coords,dist,stamp):
        # Calculate the position of the detected face

        k_f = 554 # kinect focal length in pixels

        x1, x2, y1, y2 = coords

        face_x = self.dims[1] / 2 - (x1+x2)/2.
        face_y = self.dims[0] / 2 - (y1+y2)/2.

        angle_to_target = np.arctan2(face_x,k_f)


        # Get the angles in the base_link relative coordinate system
        x, y = dist*np.cos(angle_to_target), dist*np.sin(angle_to_target)

        ### Define a stamped message for transformation - directly in "base_link"
        #point_s = PointStamped()
        #point_s.point.x = x
        #point_s.point.y = y
        #point_s.point.z = 0.3
        #point_s.header.frame_id = "base_link"
        #point_s.header.stamp = rospy.Time(0)

        # Define a stamped message for transformation - in the "camera rgb frame"
        point_s = PointStamped()
        point_s.point.x = -y
        point_s.point.y = 0
        point_s.point.z = x
        point_s.header.frame_id = "camera_rgb_optical_frame"
        point_s.header.stamp = stamp

        # Get the point in the "map" coordinate system
        try:
            point_world = self.tf_buf.transform(point_s, "map")

            # Create a Pose object with the same position
            pose = Pose()
            pose.position.x = point_world.point.x
            pose.position.y = point_world.point.y
            pose.position.z = point_world.point.z
        except Exception as e:
            print(e)
            pose = None

        return pose

    def get_new_center(self, color):
        values = self.ring_positions[color]
        center = np.mean(values, axis=0)
        diff = np.linalg.norm((center - values), axis=1)
        new_points = []
        for _ in range(int(len(values)*0.1) + 1):
            idx = np.argmin(diff)
            new_points.append(self.ring_positions[color][idx])
        return np.mean(new_points, axis=0)
    
    def detect_ring(self):
        pose = None
        colors = None
        try:
            depth_image_message = rospy.wait_for_message("/camera/depth/image_raw", Image)
            rgb_image_message = rospy.wait_for_message("/camera/rgb/image_raw", Image)
            # print(depth_image_message)
        except Exception as e:
            print(e)
            return None,None


        # Convert the images into a OpenCV (numpy) format

        try:
            rgb_image = self.bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
        except CvBridgeError as e:
            print(e)
            return None,None

        try:
            depth_image = self.bridge.imgmsg_to_cv2(depth_image_message, "32FC1")
        except CvBridgeError as e:
            print(e)
            return None,None
        
        
        
        image_1 = np.array(depth_image, dtype=np.double) / np.nanmax(depth_image)
        depth_image2 = image_1*255

        # Set the dimensions of the image
        self.dims = rgb_image.shape


        # Tranform image to gayscale
        gray = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2GRAY)

        # Do histogram equlization
        # img = cv2.equalizeHist(gray)
        
        circles = cv2.HoughCircles(np.array(depth_image2, dtype=np.uint8), cv2.HOUGH_GRADIENT, dp=2,
                                       minDist=15, param1=30, param2=70, minRadius=15, maxRadius=100)
        # circles = cv2.HoughCircles(gray, cv2.HOUGH_GRADIENT, dp=2,
        #                                 minDist=15, param1=30, param2=70, minRadius=15, maxRadius=100)
        # ori = odom_message.pose.pose.orientation
        # pos = odom_message.pose.pose.position
        if circles is not None:
            print("circles detected")
            # convert the (x, y) coordinates and radius of the circles to integers
            circles = np.round(circles[0, :]).astype("int")
            # loop over the (x, y) coordinates and radius of the circles
            for (x, y, r) in circles:
                # draw the circle in the output image, then draw a rectangle
                # corresponding to the center of the circle
                
                x1 = max(int(x - r), 0)
                x2 = min(int(x + r), self.dims[1])
                y1 = max(int(y - r), 0)
                y2 = min(int(y + r), self.dims[0])

                #preveri, ce je res obroc(da ni samo krogla) - ima luknjo v sebi
                try:
                    inner_region = depth_image[int(y-r/4):int(y+r/4), int(x-r/4):int(x+r/4)]
                    inner_depth = float(np.nanmax(inner_region))
                    if inner_depth < 20:
                        # print('inner_depth < 20')
                        continue
                except:
                    print('problem at nanmax inner region find')
                    pose = None
                    continue
                print("ring detected")

                ring_region = depth_image[y1:y2,x1:x2]
                depth_time = depth_image_message.header.stamp

                #pridobi razdaljo do obroca
                try:
                    ring_distance = float(np.nanmean(ring_region[ring_region<20]))
                    print(float(np.nanmax(ring_region)))
                    print(float(np.nanmin(ring_region)))
                except Exception as e:
                    print(e)
                    # print('problem nanmax and nanmin')
                    pose = None
                    continue
                if ring_distance > 1.8:
                    print('ring too far away')
                    pose = None
                    continue
                pose = self.get_pose((x1,x2,y1,y2), ring_distance, depth_time)

                colors = get_colors(Img.fromarray(cv2.cvtColor(rgb_image[int(y1):int(y2), int(x1):int(x2)], 
                                            cv2.COLOR_BGR2RGB)))    
                for marker in self.marker_array.markers:
                    if pose is not None:
                        x = marker.pose.position.x
                        y = marker.pose.position.y
                        x0 = pose.position.x
                        y0 = pose.position.y
                        distance = (x - x0)**2 + (y - y0)**2
                        if marker.ns == colors[1]:
                            self.ring_positions[colors[1]].append((x0,y0))
                            if len(self.ring_positions[colors[1]]) > 100:
                                self.remove_outlier(colors[1])
                            # center = np.mean(self.ring_positions[colors[1]], axis=0)
                            center = self.get_new_center(colors[1])
                            print('new center: ', center)
                            marker.pose.position.x = center[0]
                            marker.pose.position.y = center[1]
                            self.markers_pub.publish(self.marker_array)
                            next_pos = self.find_nearest_white(center)
                            rin = Ring()
                            rin.color = colors[1]
                            rin.app_x = next_pos[0]
                            rin.app_y = next_pos[1]
                            rin.app_z = next_pos[2]
                            self.ring_pub.publish(rin)                            
                            self.object_approach_locations[colors[1]] = next_pos
                            print(list(self.object_approach_locations.items()))
                            pose = None
                if pose is not None:
                    self.ring_positions[colors[1]] = [(pose.position.x, pose.position.y)]

        return pose, colors
    
    def mark_target(self):
        # print('INSIDE LOOP!')
        pose, colors = self.detect_ring()
                
        if pose is not None:

            # color = [0,1,0]
            color = colors[0]
            # print(colors)
            self.marker_num += 1
            marker = Marker()
            marker.header.stamp = rospy.Time(0)
            marker.header.frame_id = 'map'
            marker.pose = pose
            marker.type = Marker.CUBE
            marker.action = Marker.ADD
            marker.frame_locked = False
            marker.lifetime = rospy.Duration.from_sec(22*60)
            marker.id = self.marker_num
            marker.scale = Vector3(0.1, 0.1, 0.1)
            marker.color = ColorRGBA(color[0], color[1], color[2], 1)
            marker.ns = colors[1]
            self.marker_array.markers.append(marker)
            self.markers_pub.publish(self.marker_array)
            # cv2.rectangle(depth_image, (x1, y1), (x2,y2), (0, 255, 255), 2)
            # self.picture_pub.publish(self.bridge.cv2_to_imgmsg(depth_image))
            # self.picture2_pub.publish(self.bridge.cv2_to_imgmsg(rgb_image))
            return True
        else:
            return False


    def find_rings(self):
        pose, colors = self.detect_ring()
        
        if pose is not None:
            # angle = self.get_angle_to_ring((x1,x2,y1,y2), ring_distance, depth_time)
            # tw = Twist()
            # tw.angular.z = angle
            # tw.angular.x = 0.0
            # tw.angular.y = 0.0
            # tw.linear.x = 0.0
            # tw.linear.y = 0.0
            # tw.linear.z = 0.0

            # find nearest available space
            # map_height = 240
            # map_width = 256           
            # nearest_pt = Vector3()
            # nearest_pt.x = nearest_idx[0][0]*0.05 - 12.2
            # nearest_pt.y = (512-nearest_idx[0][1])*0.05 - 12.2
            # nearest_pt.z = 0
            # print('nearest points:', nearest_pt.x, nearest_pt.y)

            # transform into map coordinates
            # self.map_point_pub.publish(nearest_pt)
            # transformed_map_pt = transformed_point

            # if(transformed_map_pt is not None):
            #     self.pose_pub.publish(transformed_map_pt)
            
            # self.twist_pub.publish(tw)
            # rospy.sleep(3)
            self.mark_target()

                
        return None


    def depth_callback(self,data):

        try:
            depth_image = self.bridge.imgmsg_to_cv2(data, "32FC1")
        except CvBridgeError as e:
            print(e)

        # Do the necessairy conversion so we can visuzalize it in OpenCV
        
        image_1 = depth_image / np.nanmax(depth_image)
        image_1 = image_1*255
        
        image_viz = np.array(image_1, dtype=np.uint8)


def main():

        ring_finder = ring_localizer()

        rate = rospy.Rate(20)
        # rospy.spin()
        while not rospy.is_shutdown():
            ring_finder.mark_target()
            rate.sleep()

        cv2.destroyAllWindows()


if __name__ == '__main__':
    main()
