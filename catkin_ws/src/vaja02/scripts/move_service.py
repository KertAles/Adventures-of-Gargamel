#!/usr/bin/env python

import rospy
import random
from geometry_msgs.msg import Twist
from vaja02.srv import Movement, MovementResponse

pub = rospy.Publisher('turtle1/cmd_vel', Twist, queue_size = 1000) 

def rectangle_movement(step):
	twist = Twist()
	twist.linear.x = 0.5
	step = step % 20
	if step % 5 == 0:
		twist.linear.x = 0
		twist.angular.z = 1.57 #(90 / 360) * 2 * 3.14
	return twist

def triangle_movement(step):
	twist = Twist()
	twist.linear.x = 0.5
	step = step % 20
	if step % 5 == 0:
		twist.linear.x = 0
		twist.angular.z = 2.093 #(120 / 360) * 2 * 3.14
	return twist

def circle_movement(): 
	twist = Twist()
	twist.linear.x = 0.5
	twist.angular.z = 0.5
	return twist

def random_movement(): 
	twist = Twist()
	twist.linear.x = 0.5
	twist.angular.z = random.uniform(-1.5, 1.5)
	return twist

def movement(req):
#todo globalen publisher
	global pub
	r = rospy.Rate(1)
	step = 0.0
	shape = req.move_shape

	for i in range(req.duration):
		twist = Twist()
		if shape == 'rectangle':
			twist = rectangle_movement(step)
		elif shape == 'triangle':
			twist = triangle_movement(step)
		elif shape == 'circle':
			twist = circle_movement()
		else:
			twist = random_movement()
		pub.publish(twist)
		step = step + 1.0
		r.sleep()
	return MovementResponse(shape)

def move_turtle():
	rospy.init_node("move_service")
	s = rospy.Service("move_service", Movement, movement)
	rospy.spin() #kepp python from exiting until this node stops #todo zamenjaj z while loop


if __name__ == '__main__':
	move_turtle()