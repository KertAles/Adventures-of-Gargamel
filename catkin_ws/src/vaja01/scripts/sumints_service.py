#!/usr/bin/env python

import rospy
from vaja01.srv import ArrayOfInts, ArrayOfIntsResponse

def sum_over_array(req):
	a = req.vrsta
	return ArrayOfIntsResponse(sum(a))

def sum_ints_server():
	rospy.init_node("sumints_service")
	s = rospy.Service("sumints_service", ArrayOfInts, sum_over_array)
	rospy.spin() #kepp python from exiting until this node stops


if __name__ == '__main__':
	sum_ints_server()