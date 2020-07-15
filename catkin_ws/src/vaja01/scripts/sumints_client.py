#!/usr/bin/env python

import rospy
from vaja01.srv import ArrayOfInts, ArrayOfIntsResponse

from random import randint


def sum_ints_client(A):
	rospy.wait_for_service("sumints_service")
	try:
		arraySum = rospy.ServiceProxy('sumints_service', ArrayOfInts)
		resp1 = arraySum(A)
		return resp1.vsota
	except rospy.ServiceException, e:
		print "service call failed: %s"%e


if __name__ == '__main__':
	answer = 'y'
	while answer == 'y':
		A = []
		for i in range(10):
			A.append(randint(0, 100))
		print A
		s = sum_ints_client(A)
		print s
		answer = raw_input("\ngenerate new sequence? y/n ")
