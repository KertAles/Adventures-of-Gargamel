#!/usr/bin/env python
from __future__ import print_function
import rospy
import cv2
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import os


bridge = CvBridge()
mypath = '/home/avrelij/Documents/RINS/catkin_ws/src/take_picture/faces/'

def take_picture():

    facenum = raw_input('type facenum: ') #facenum
    try:
        rgb_image_message = rospy.wait_for_message("/camera/rgb/image_raw", Image)
        # print(rgb_image_message.header.stamp.nsecs,"rgb")
    except Exception as e:
        print(e)
        return None

    # print('hello')

    try:
        rgb_image = bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
    except CvBridgeError as e:
        print(e)
        return None

    if not os.path.exists(mypath + 'face_'+str(facenum)):
    	os.mkdir(mypath + 'face_' + str(facenum))

    i = 0
    while os.path.exists(mypath + 'face_' + str(facenum) + '/{:0>3d}.jpg'.format(i)):
    	i += 1


    cv2.imwrite(mypath + 'face_' + str(facenum) + '/{:0>3d}.jpg'.format(i), rgb_image)


def main():
	rospy.init_node('take_picture')
	rate = rospy.Rate(1)
	try:
		# Initializes a rospy node to let the SimpleActionClient publish and subscribe
		while not rospy.is_shutdown():
			take_picture()
			rate.sleep()
	except rospy.ROSInterruptException:
		rospy.loginfo("ending process")	

if __name__ == '__main__':
	main()