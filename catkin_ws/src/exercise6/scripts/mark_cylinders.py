#!/usr/bin/env python
import rospy
from visualization_msgs.msg import Marker, MarkerArray
from std_msgs.msg import ColorRGBA
import numpy as np
from sensor_msgs.msg import Image
import cv2
from cv_bridge import CvBridge, CvBridgeError
from PIL import Image as Img
from color_recognition import get_colors
from nav_msgs.msg import OccupancyGrid
from exercise6.msg import Cylinder
from geometry_msgs.msg import Vector3
from exercise6.msg import Cylinder_sensor


class markers:
    def __init__(self):
        rospy.init_node('cylinder_marker_array_node', anonymous=True)
        self.pub = rospy.Publisher("cylinder_marker_array", MarkerArray, queue_size=100)
        # self.sub = rospy.Subscriber("/detected_cylinder", Marker, callback=self.callback)
        self.sub = rospy.Subscriber("/cylinder_sensor", Cylinder_sensor, callback=self.callback)
        self.cylinder_pub = rospy.Publisher('cylinders_pos', Cylinder, queue_size=10)
        self.marker_array = MarkerArray()
        self.markernum = 1
        self.bridge = CvBridge()
        self.counter = {"red":False,"green":False,"yellow":False,"blue":False}
        self.cylinder_positions = {}
        self.object_approach_locations = {}

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
            return None      
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
        return (map_x, map_y, angle)

    def get_new_center(self, color):
        values = self.cylinder_positions[color]
        center = np.mean(values, axis=0)
        diff = np.linalg.norm((center - values), axis=1)
        new_points = []
        for _ in range(int(len(values)*0.1) + 1):
            idx = np.argmin(diff)
            new_points.append(self.cylinder_positions[color][idx])
        return np.mean(new_points, axis=0)

    def remove_outlier(self, color):
        #remove 10 outliers
        values = self.cylinder_positions[color]
        center = np.mean(values, axis=0)
        diff = np.linalg.norm((center - values), axis=1)
        for _ in range(100):
            idx = np.argmax(diff)
            self.cylinder_positions[color].pop(idx)
            diff = np.delete(diff, idx)

    def callback(self, cylinder_sensor):
        rgb_image_message = cylinder_sensor.c_image
        new_marker = cylinder_sensor.c_marker
        print('got marker')
        # try:
        #     rgb_image_message = rospy.wait_for_message("/rgb_cylinder", Image, timeout=0.1)
        #     # print(depth_image_message)
        # except Exception as e:
        #     print(e)
        #     return 0
        try:
            rgb_image = self.bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
        except CvBridgeError as e:
            print(e)

        colors = get_colors(Img.fromarray(cv2.cvtColor(rgb_image, cv2.COLOR_BGR2RGB)))
        color = colors[0]
        print(colors[1])
        if colors[1] == 'N/A':
            print('not colorful enough')
            return
        print(new_marker.pose.position.x)
        print(new_marker.pose.position.y)
        new_marker.lifetime = rospy.Duration.from_sec(22*60)
        new_marker.color = ColorRGBA(color[0], color[1], color[2], 1)
        new_marker.ns = colors[1]

        if colors[1] not in self.cylinder_positions:
            new_marker.id = self.markernum
            app_pose = self.find_nearest_white([new_marker.pose.position.x, new_marker.pose.position.y])
            self.markernum += 1
            self.object_approach_locations[colors[1]] = [app_pose]
            self.cylinder_positions[colors[1]] = [(new_marker.pose.position.x,new_marker.pose.position.y)]
            self.marker_array.markers.append(new_marker)
            self.pub.publish(self.marker_array)
            return
        self.cylinder_positions[colors[1]].append((new_marker.pose.position.x,new_marker.pose.position.y))
        if len(self.cylinder_positions[colors[1]]) > 200:
            self.remove_outlier(colors[1])
        center = self.get_new_center(colors[1])
        print('new center: ', center)
        for marker in self.marker_array.markers:
            if marker.ns == colors[1]:
                marker.pose.position.x = center[0]
                marker.pose.position.y = center[1]
        next_pos = self.find_nearest_white(center)
        self.object_approach_locations[colors[1]] = next_pos
        self.pub.publish(self.marker_array)
        cyl = Cylinder()
        cyl.color = colors[1]
        cyl.app_x = next_pos[0]
        cyl.app_y = next_pos[1]
        cyl.app_z = next_pos[2]
        self.cylinder_pub.publish(cyl)       



        # try:
        #     print(len(self.marker_array.markers), " number of markers")
        #     # rospy.loginfo("received marker")
        #     new_marker.color = ColorRGBA(color[0], color[1], color[2], 1)
        #     for i, marker in enumerate(self.marker_array.markers):
        #         x = marker.pose.position.x
        #         y = marker.pose.position.y
        #         x0 = new_marker.pose.position.x
        #         y0 = new_marker.pose.position.y
        #         distance = (x - x0)**2 + (y - y0)**2
        #         if distance < 0.3:
        #             self.cylinder_positions[colors[1]].append((x0,y0))
        #             if len(self.cylinder_positions[colors[1]]) > 200:
        #                 self.remove_outlier(colors[1])
        #             center = np.mean(self.cylinder_positions[colors[1]], axis=0)
        #             print('new center: ', center)
        #             marker.pose.position.x = center[0]
        #             marker.pose.position.y = center[1]
        #             self.pub.publish(self.marker_array)
        #             next_pos = self.find_nearest_white(marker.pose)
        #             self.object_approach_locations[colors[1]] = next_pos
        #             cyl = Cylinder()
        #             cyl.color = colors[1]
        #             cyl.app_x = next_pos[0]
        #             cyl.app_y = next_pos[1]
        #             cyl.app_z = next_pos[2]
        #             self.cylinder_pub.publish(cyl)
        #             print(list(self.object_approach_locations.values()))
        #             return
        #     self.cylinder_positions[colors[1]] = [(new_marker.pose.position.x, new_marker.pose.position.y)]
        #     self.counter[colors[1]] = True
        #     new_marker.ns = colors[1]
        #     self.marker_array.markers.append(new_marker)
        #     self.pub.publish(self.marker_array)
        #     self.markernum += 1
        # except Exception as e:
        #     print(e)

    def publisher(self):
        print("publishing all markers")
        # self.pub.publish(self.marker_array)

def main():
    cylinder_marking = markers()
    rate = rospy.Rate(10)
    rospy.spin()
    while not rospy.is_shutdown():
        cylinder_marking.publisher()
        rate.sleep()

if __name__ == "__main__":
    main()