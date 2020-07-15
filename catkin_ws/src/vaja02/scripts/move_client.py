#!/usr/bin/env python

import rospy
import random
from vaja02.srv import Movement, MovementResponse


def move_turtle(shape, duration):
	rospy.wait_for_service("move_service")
	try:
		movement = rospy.ServiceProxy('move_service', Movement)
		resp1 = movement(shape, duration)
	except rospy.ServiceException, e:
		print "service call failed: %s"%e


if __name__ == '__main__':
	possible_moves = ['rectangle', 'triangle', 'circle', 'random']
	shape = raw_input('select shape (rectangle/triangle/circle/random) or exit\n')
	duration = raw_input('select duration [seconds]')
	while shape in possible_moves:
		print "shape is '{}', duration is '{}'".format(shape, duration)
		move_turtle(shape, int(duration))
		shape = raw_input('select shape (rectangle/triangle/circle/random) or exit: ')
		if shape not in possible_moves:
			print "shape not possible, exiting!"
			break
		duration = raw_input('select duration [seconds]: ')


