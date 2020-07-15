#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from vaja01.msg import string_ID

def publish():
	pub = rospy.Publisher('chatter', string_ID, queue_size=10)
	rospy.init_node('publisher')
	r = rospy.Rate(1)
	ID = 0
	while not rospy.is_shutdown():
		ID += 1
		s = raw_input()
		pub.publish(s, ID)
		r.sleep()


if __name__ == '__main__':
	print "type your messages!"
	try:
		publish()
	except rospy.ROSInterruptException:
		pass