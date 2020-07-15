#!/usr/bin/env python
from __future__ import print_function

import sys
import os
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
from sensor_msgs.msg import Image
from exercise4.msg import turtle_pos
from math import pi
from face_recognition import face_encodings
from sklearn.svm import SVC
from std_msgs.msg import String
from sklearn.preprocessing import Normalizer
from sklearn.preprocessing import LabelEncoder
from nav_msgs.msg import OccupancyGrid
from exercise4.msg import Person
import tf2_ros
# from tensorflow.keras.models import load_model
# face_model = load_model('/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/facenet_keras.h5')



class face_localizer:   
	def __init__(self):
		rospy.init_node('face_localizer', anonymous=True)

		print(cv2.__version__)
		# An object we use for converting images between ROS format and OpenCV format
		self.bridge = CvBridge()

		#initialize neural net
		self.min_conf = 0.85
		self.net = cv2.dnn.readNetFromCaffe("/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/deploy.prototxt.txt",
			"/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/res10_300x300_ssd_iter_140000.caffemodel")


		# A help variable for holding the dimensions of the image
		self.dims = (0, 0, 0)

		# Marker array object used for showing markers in Rviz
		self.marker_array = MarkerArray()
		self.marker_num = 1


		self.tf2_buffer = tf2_ros.Buffer()
		self.tf2_listener = tf2_ros.TransformListener(self.tf2_buffer)
		# Subscribe to the image and/or depth topic
		# self.image_sub = rospy.Subscriber("/camera/rgb/image_raw", Image, self.image_callback)
		# self.depth_sub = rospy.Subscriber("/camera/depth/image_raw", Image, self.depth_callback)

		# Publiser for the visualization markers
		self.markers_pub = rospy.Publisher('face_markers', MarkerArray, queue_size=1000)
		self.image_pub = rospy.Publisher('/static_image', Image, queue_size=10)
		self.pose_pub = rospy.Publisher('extra_pose', Vector3, queue_size=30)
		self.extra_finished_sub = rospy.Subscriber('extra_finished', String)
		self.person_pub = rospy.Publisher('people', Person, queue_size=10)
		self.face_positions = {}
		self.object_approach_locations = {}
		self.face_features = {}

		# Object we use for transforming between coordinate frames
		self.tf_buf = tf2_ros.Buffer()
		self.tf_listener = tf2_ros.TransformListener(self.tf_buf)

		#face reconition model
		data = np.load('/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/train_test_data.npz', allow_pickle=True)
		X, y = data['arr_0'], data['arr_1']
		self.in_encoder = Normalizer(norm='l2')
		X = self.in_encoder.transform(X)
		self.svm_model = SVC(kernel='linear', probability=False)
		self.svm_model.fit(X, y)
		print('created face model')

		# #hair lenght model
		data = np.load('/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/length_data_embed.npz', allow_pickle=True)
		X, y = data['arr_0'], data['arr_1']
		self.in_encoder_l = Normalizer(norm='l2')
		self.out_encoder_l = LabelEncoder()
		self.out_encoder_l.fit(y)
		y = self.out_encoder_l.transform(y)
		X = self.in_encoder_l.transform(X)
		self.svm_model_l = SVC(kernel='linear', probability=False)
		self.svm_model_l.fit(X, y)
		print('created length model')

		#hair color model
		data = np.load('/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/data/hair_data_embed.npz', allow_pickle=True)
		X, y = data['arr_0'], data['arr_1']
		self.in_encoder_c = Normalizer(norm='l2')
		self.out_encoder_c = LabelEncoder()
		self.out_encoder_c.fit(y)
		y = self.out_encoder_c.transform(y)
		X = self.in_encoder_c.transform(X)
		self.svm_model_c = SVC(kernel='linear', probability=False)
		self.svm_model_c.fit(X, y)
		print('created color model')

		self.imcount = 0

	def remove_outlier(self, color):
		amount = len(self.face_positions[color]) / 2
		#remove 100 outliers from 200 points
		values = self.face_positions[color]
		center = np.mean(values, axis=0)
		diff = np.linalg.norm((center - values), axis=1)
		for i in range(amount):
			idx = np.argmax(diff)
			self.face_positions[color].pop(idx)
			diff = np.delete(diff, idx)


	def find_nearest_white(self, pose, dx, dy):
		try:
			global_map = rospy.wait_for_message("/move_base/global_costmap/costmap", OccupancyGrid)
			a = np.array(global_map.data)
			a[a==-1] = 255
			a = 255 - a
			a[a<210] = 0
			a = np.array(a, dtype=np.uint8)
			a = np.resize(a, (512, 480))
			a = np.flip(a, axis=0)
			# cv2.imshow("name", a)
			# cv2.waitKey(0)
		except Exception as e:
			print(e, 'WRONGGG') 
			return None, None, None
		#convert to pixels
		try:
			x = pose.position.x 
			y = pose.position.y
			px, py = (int((pose.position.x+dx + 12.2)*20), int(512 - (pose.position.y+dy)*20 - 12.2*20))
			nonzero = cv2.findNonZero(a)
			distances = np.sqrt((nonzero[:,:,0] - px) ** 2 + (nonzero[:,:,1] - py) ** 2)
			nearest_index = np.argmin(distances)
			#convert to map frame
			nearest_idx = nonzero[nearest_index]
			map_x = nearest_idx[0][0]*0.05 - 12.2
			map_y = (512-nearest_idx[0][1])*0.05 - 12.2
			angle = np.arctan2(y-map_y,x-map_x)
		except Exception as e:
			print(e)
			print(e, 'WRONGGG') 
			return None, None, None
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

	def examine_face(self):
	  # print('I got a new image!')

		# Get the next rgb and depth images that are posted from the camera
		try:
			rgb_image_message = rospy.wait_for_message("/camera/rgb/image_raw", Image)
		except Exception as e:
			print(e)
			return 0

		try:
			depth_image_message = rospy.wait_for_message("/camera/depth/image_raw", Image)
		except Exception as e:
			print(e)
			return 0

		# Convert the images into a OpenCV (numpy) format

		try:
			rgb_image = self.bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
		except CvBridgeError as e:
			print(e)

		try:
			depth_image = self.bridge.imgmsg_to_cv2(depth_image_message, "32FC1")
		except CvBridgeError as e:
			print(e)

		# Set the dimensions of the image
		self.dims = rgb_image.shape
		image = rgb_image
		# Tranform image to gayscale
		# gray = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2GRAY)

		# Do histogram equlization
		# img = cv2.equalizeHist(gray)
		(h,w) = rgb_image.shape[:2]
		# Detect the faces in the image
		blob = cv2.dnn.blobFromImage(rgb_image, scalefactor=1.0, size=(300,300), mean=(104.0, 177.0, 123.0))
		self.net.setInput(blob)
		detections = self.net.forward()

		# For each detected face, extract the depth from the depth image
		for i in range(0, detections.shape[2]):
			confidence = detections[0, 0, i, 2]
			if confidence > self.min_conf:
				# print(i, 'Faces were detected')-
				box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
				(x1, y1, x2, y2) = box.astype("int")

				# Extract region containing face
				face_region = rgb_image[y1:y2,x1:x2]

				# Visualize the extracted face
				# cv2.imshow("Depth window", face_region)
				# cv2.waitKey(1)
				h0 = (y2-y1)
				w0 = (x2-x1)
				# Find the distance to the detected face
				face_distance = float(np.nanmean(depth_image[int(y1+h0*0.4):int(y1+h0*0.6),int(x1+w0*0.4):int(x1+w0*0.6)]))
				try:
					f_max = float(np.max(depth_image[y1:y2, x1:x2]))
					f_min = float(np.min(depth_image[y1:y2, x1:x2]))
				except:
					print('problem at max & min')
					face_distance = 3.0 #opusti zaznavo

				#Ce je zaznava predalec, je ne upostevaj, ce obraz zaznan dalec in blizu, ne upostevaj
				if face_distance > 1.4 or f_max - f_min > 0.7:
					break


				print('Distance to face', face_distance)

				# Get the time that the depth image was recieved
				depth_time = depth_image_message.header.stamp

				# Find the location of the detected face
				pose = self.get_pose((x1,x2,y1,y2), face_distance, depth_time)
				try:
					pose1 = self.get_pose((x1,x1,y1,y2), float(np.nanmean(depth_image[int(y1+h0*0.5),x1])), depth_time)
					pose2 = self.get_pose((x2,x2,y1,y2), float(np.nanmean(depth_image[int(y1+h0*0.5),x2-2])), depth_time)
					#calculate how to approach face at 90 degrees
					if pose is not None and pose1 is not None and pose2 is not None:
						surf_vec = (pose2.position.x - pose1.position.x, pose2.position.y - pose1.position.y)
						trans = (surf_vec[1], -surf_vec[0])
						l = np.linalg.norm(trans)
						# next_pose = Pose()
						# next_pose.position.x = pose.position.x + trans[0]/l * 0.45
						# next_pose.position.y = pose.position.y + trans[1]/l * 0.45
						# next_pose.position.z = pose.position.z
						next_pose = self.find_nearest_white(pose, trans[0]/l * 0.1, trans[1]/l * 0.1)
					# next_pose = self.find_nearest_white(pose, 0, 0)
				except Exception as e:
					print(e)
					continue
					pose = None



				# if pose is not None:
				#     pose.orientation.w = np.arctan2(-trans[1], -trans[0]) + pi

				if pose is not None:
					# rgb = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2RGB)
					rec_w = x2 - x1
					rec_h = y2 - y1
					# x1 -= int(0.2*rec_w)
					# x2 += int(0.2*rec_w)
					# y1 -= int(0.2*rec_h)
					if x1 >= 0 and x2 <= w and y1 >= 0:
						encoding = face_encodings(rgb_image[y1:y2,x1:x2])
						if len(encoding) > 0:
							myX = self.in_encoder.transform(encoding)        
							myX_c = self.in_encoder_c.transform(encoding)
							myX_l = self.in_encoder_l.transform(encoding)
							facenum = self.svm_model.predict(myX)[0]
							hair_color = self.svm_model_c.predict(myX_c)[0]
							hair_length = self.svm_model_l.predict(myX_l)[0]
							if not isinstance(facenum, int):
								pose = None
						else:
							pose = None
					else:
						pose = None        
				if pose is not None:
					return facenum, hair_color, hair_length
			break
		return None, None, None

	def get_new_center(self, face_id):
		values = self.face_positions[face_id]
		center = np.mean(values, axis=0)
		diff = np.linalg.norm((center - values), axis=1)
		new_points = []
		for _ in range(int(len(values)*0.1) + 1):
			idx = np.argmin(diff)
			new_points.append(self.face_positions[face_id][idx])
		return np.mean(new_points, axis=0)

	def find_faces(self):
		# print('I got a new image!')
		try:
			trans = self.tf2_buffer.lookup_transform('map', 'base_link', rospy.Time(0))
		except Exception as e:
			print(e)
			return 0

		# Get the next rgb and depth images that are posted from the camera
		try:
			rgb_image_message = rospy.wait_for_message("/camera/rgb/image_raw", Image)
		except Exception as e:
			print(e)
			return 0

		try:
			depth_image_message = rospy.wait_for_message("/camera/depth/image_raw", Image)
		except Exception as e:
			print(e)
			return 0

		# Convert the images into a OpenCV (numpy) format

		try:
			rgb_image = self.bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
		except CvBridgeError as e:
			print(e)

		try:
			depth_image = self.bridge.imgmsg_to_cv2(depth_image_message, "32FC1")
		except CvBridgeError as e:
			print(e)

		# Set the dimensions of the image
		self.dims = rgb_image.shape
		image = rgb_image
		# Tranform image to gayscale
		# gray = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2GRAY)

		# Do histogram equlization
		# img = cv2.equalizeHist(gray)
		(h,w) = rgb_image.shape[:2]
		# Detect the faces in the image
		blob = cv2.dnn.blobFromImage(rgb_image, scalefactor=1.0, size=(300,300), mean=(104.0, 177.0, 123.0))
		self.net.setInput(blob)
		detections = self.net.forward()

		# For each detected face, extract the depth from the depth image
		for i in range(0, detections.shape[2]):
			confidence = detections[0, 0, i, 2]
			if confidence > self.min_conf:
				# print(i, 'Faces were detected')
				box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
				(x1, y1, x2, y2) = box.astype("int")

				# Extract region containing face
				face_region = rgb_image[y1:y2,x1:x2]

				# Visualize the extracted face
				# cv2.imshow("Depth window", face_region)
				# cv2.waitKey(1)
				h0 = (y2-y1)
				w0 = (x2-x1)
				# Find the distance to the detected face
				face_distance = float(np.nanmean(depth_image[int(y1+h0*0.4):int(y1+h0*0.6),int(x1+w0*0.4):int(x1+w0*0.6)]))
				try:
					f_max = float(np.max(depth_image[y1:y2, x1:x2]))
					f_min = float(np.min(depth_image[y1:y2, x1:x2]))
				except:
					print('problem at max & min')
					face_distance = 3.0 #opusti zaznavo

				#Ce je zaznava predalec, je ne upostevaj, ce obraz zaznan dalec in blizu, ne upostevaj
				if face_distance > 1.7 or f_max - f_min > 0.7:
					break


				print('Distance to face', face_distance)

				# Get the time that the depth image was recieved
				depth_time = depth_image_message.header.stamp

				# Find the location of the detected face
				pose = self.get_pose((x1,x2,y1,y2), face_distance, depth_time)
				try:
					pose1 = self.get_pose((x1,x1,y1,y2), float(np.nanmean(depth_image[int(y1+h0*0.5),x1])), depth_time)
					pose2 = self.get_pose((x2,x2,y1,y2), float(np.nanmean(depth_image[int(y1+h0*0.5),x2-2])), depth_time)
					if pose is not None and pose1 is not None and pose2 is not None:
						surf_vec = (pose2.position.x - pose1.position.x, pose2.position.y - pose1.position.y)
						trans = (surf_vec[1], -surf_vec[0])
						l = np.linalg.norm(trans)
						
						# next_pose.position.x = pose.position.x + trans[0]/l * 0.45
						# next_pose.position.y = pose.position.y + trans[1]/l * 0.45
						# next_pose.position.z = pose.position.z
					# tr = np.array([trans.transform.translation.x - pose.position.x, trans.transform.translation.y - pose.position.y])
					# tr = 0.1*tr / np.linalg.norm(tr)                  
						next_pose = self.find_nearest_white(pose, trans[0]/l * 0.1, trans[1]/l * 0.1)
					# next_pose = self.find_nearest_white(pose, 0, 0)
					# #calculate how to approach face at 90 degrees
				except Exception as e:
					print(e)
					continue
					pose = None
				if next_pose is None:
					pose is None
					break

				# if pose is not None:
				#     pose.orientation.w = np.arctan2(-trans[1], -trans[0]) + pi

				if pose is not None:
					# rgb = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2RGB)
					rec_w = x2 - x1
					rec_h = y2 - y1
					# x1 -= int(0.2*rec_w)
					# x2 += int(0.2*rec_w)
					# y1 -= int(0.2*rec_h)
					if x1 >= 0 and x2 <= w and y1 >= 0:
						encoding = face_encodings(cv2.cvtColor(rgb_image[y1:y2, x1:x2], cv2.COLOR_BGR2RGB))
						if len(encoding) > 0:
							myX = self.in_encoder.transform(encoding)        
							facenum = self.svm_model.predict(myX)[0]
							if not isinstance(facenum, int):
								pose = None
						else:
							pose = None
					else:
						pose = None

				for marker in self.marker_array.markers:
					if pose is not None and marker.ns == "face_pos":
						x = marker.pose.position.x
						y = marker.pose.position.y
						x0 = pose.position.x
						y0 = pose.position.y
						distance = (x - x0)**2 + (y - y0)**2
						if marker.id == facenum:
							# if distance > 0.4:
							#     pose = None
							#     print('wrong recognition')
							#     break
							print('not new face')
							self.face_positions[facenum].append((x0,y0))
							if len(self.face_positions[facenum]) > 50:
								self.remove_outlier(facenum)
							# center = np.mean(self.face_positions[facenum], axis=0)
							center = self.get_new_center(facenum)
							print('new center: ', center)
							marker.pose.position.x = center[0]
							marker.pose.position.y = center[1]
							self.markers_pub.publish(self.marker_array)
							self.object_approach_locations[facenum] = next_pose
							person = Person()
							person.id = facenum
							person.app_x = next_pose[0]
							person.app_y = next_pose[1]
							person.app_z = next_pose[2]
							person.hair_col = self.face_features[facenum]['color']
							person.hair_len = self.face_features[facenum]['length']
							self.person_pub.publish(person)
							# print(list(self.object_approach_locations.items()))
							print(facenum, self.face_features[facenum])
							# cv2.imshow('face', rgb_image[y1:y2, x1:x2])
							# cv2.waitKey(0)
							pose = None


				
				# try:
				#     rgb = cv2.cvtColor(rgb_image, cv2.COLOR_BGR2RGB)
				#     encoding = face_encodings(rgb[y1:y2,x1:x2])
				#     myX = self.in_encoder.transform(encoding)
				#     facenum = self.svm_model.predict(myX)
				#     print(facenum)
				# except:
				#     pose = None
				#     print('empty stuff')
				#     cv2.imshow('face', rgb[y1:y2,x1:x2])
				#     cv2.waitKey(0)


				if pose is not None:
					# i = 0
					# path = '/home/avrelij/Documents/RINS/catkin_ws/src/exercise4/face_data/'+'face_'+str(int(facenum))+'_'
					# while os.path.exists(path+str(i)+'.jpg'):
					#     i += 1
					# if i < 100:
					#     print('writing image to file')
					#     cv2.imwrite(path +str(i)+'.jpg', rgb_image[y1:y2, x1:x2])
					#naredi novo pozicijo, kamor bo sel robot pozdravit obraz

					v = Vector3()
					v.x = next_pose[0]
					v.y = next_pose[1]
					v.z = next_pose[2]
					self.pose_pub.publish(v)
					rospy.wait_for_message('extra_finished', String) #wait for extra goal to be reached
					facenum, hair_color, hair_length = self.examine_face()
					if isinstance(facenum, int) and hair_color is not None and hair_length is not None:
						# if facenum == 14:
						   #  image = cv2.rectangle(rgb_image, (x1,y1), (x2,y2), (50,255,50), 2)
						# 	cv2.imshow('image',  image)
						# 	cv2.waitKey(0)
						# Create a marker used for visualization
						# print(hair_color)
						# print(self.out_encoder_c.inverse_transform([hair_color]))
						hc = self.out_encoder_c.inverse_transform([hair_color])[0]
						hl = self.out_encoder_l.inverse_transform([hair_length])[0]
						print('face '+str(facenum)+ ' has '+hc+' '+hl+" hair.")
						self.face_features[facenum] = {'color':hc, 'length':hl}
						self.face_positions[facenum] = [(pose.position.x, pose.position.y)]
						self.face_positions[facenum]
						print(facenum, self.face_positions[facenum])
						print('next pose:', next_pose)
						self.marker_num += 1
						marker = Marker()
						marker.ns = "face_pos"
						marker.header.stamp = rospy.Time(0)
						marker.header.frame_id = 'map'
						marker.pose = pose
						marker.type = Marker.SPHERE
						marker.action = Marker.ADD
						marker.frame_locked = False
						marker.lifetime = rospy.Duration.from_sec(22*60)
						marker.id = facenum
						marker.scale = Vector3(0.13, 0.13, 0.13)
						if hair_color == 0:
							marker.color = ColorRGBA(0.6, 0.4, 0.0, 1)
						elif hair_color == 1:
							marker.color = ColorRGBA(1.0, 0.6, 0.0, 1)
						self.marker_array.markers.append(marker)

					#marker, kam naj gre robot pozdravit obraz
					# self.marker_num += 1
					# marker = Marker()
					# marker.ns = 'robo_pos'
					# marker.header.stamp = rospy.Time(0)
					# marker.header.frame_id = 'map'
					# marker.pose = next_pose
					# marker.type = Marker.ARROW
					# marker.action = Marker.ADD
					# marker.frame_locked = False
					# marker.lifetime = rospy.Duration.from_sec(22*60)
					# marker.id = self.marker_num
					# marker.scale = Vector3(0.1, 0.1, 0.1)
					# marker.color = ColorRGBA(1, 0, 0, 1)
					# self.marker_array.markers.append(marker)

					self.markers_pub.publish(self.marker_array)
				#draw bounding box to image
				image = cv2.rectangle(rgb_image, (x1,y1), (x2,y2), (50,255,50), 2)

				#publish image with rectangle around face
				self.image_pub.publish(self.bridge.cv2_to_imgmsg(image))
			break

	def depth_callback(self,data):

		try:
			depth_image = self.bridge.imgmsg_to_cv2(data, "32FC1")
		except CvBridgeError as e:
			print(e)

		# Do the necessairy conversion so we can visuzalize it in OpenCV
		
		image_1 = depth_image / np.nanmax(depth_image)
		image_1 = image_1*255
		
		image_viz = np.array(image_1, dtype=np.uint8)

		#cv2.imshow("Depth window", image_viz)
		#cv2.waitKey(1)

		#plt.imshow(depth_image)
		#plt.show()

def main():

		face_finder = face_localizer()

		rate = rospy.Rate(3)
		while not rospy.is_shutdown():
			face_finder.find_faces()
			rate.sleep()

		cv2.destroyAllWindows()


if __name__ == '__main__':
	main()
