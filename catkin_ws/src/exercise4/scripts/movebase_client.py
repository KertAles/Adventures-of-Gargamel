#!/usr/bin/env python

import rospy
import numpy as np
# Brings in the SimpleActionClient
import actionlib
# Brings in the .action file and messages used by the move base action
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Vector3

from tf.transformations import quaternion_from_euler

from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient
from math import pi

# main_poses = [ (4.5,1.2,4.3), (5.5,1.0,4.6), (5.5,1.4,0.1), (5.0,2.4,1.6), (4.0,2.0,1.6), (2.5,3.0,1.6), (3.0, 0.0, 1.6)] #zacetna navigacija po mapi
main_poses = [(3.0, 0.0, 1.6),
				(4.1,1.0,0.0+1./2*pi), (4.1,1.0,0.2+3./2*pi), 
				(5.4, 1.2, 0.3),(5.4, 1.2, 0.0), (5.4, 1.2, 0.1 - 1./2 * pi),
				(5.3, 2.0, 0.1 + 1./2 * pi),(5.3, 2.0, 0.1 + 0./2 * pi),
				(4.0,2.2,0.2+1./2*pi), (4.0,2.2,0.0-1./2*pi),
				(2.5,3.2,0.1+1./2*pi), (2.5,3.2,0.1+0./2*pi), (2.5,3.2,0.1+5./4*pi), (2.5,3.2,0.1+2./2*pi), 
				(3.0, 1.5, 0.1+ 3.0/4 * pi),(3.0, 1.5, 0.1+ 5.0/4 * pi),
				(3.0, 0.0, 1.6)]
extra_poses = [] #te tocke se dodajo sproti
x = 0.0
y = 0.0
w = 1.0

voice = 'voice_kal_diphone'
volume = 1.0
soundhandle = SoundClient()

client = actionlib.SimpleActionClient('move_base',MoveBaseAction)

def pose_callback(pose):
	#pose.z je ubistvu kot rotacije v ravnini x/y
	if np.sum(np.isnan([pose.x, pose.y, pose.z])) == 0:
		extra_poses.append((pose.x, pose.y, pose.z))
		print('got new extra pose')
		print(extra_poses)

pose = rospy.Subscriber('extra_pose', Vector3, callback=pose_callback)

def callback_feedback(feedback):
	rospy.loginfo("Feedback:%s" % str(feedback))

def callback_done(state, result):
	rospy.loginfo("Action server is done. State: %s, result: %s" % (str(state), str(result)))
	if state >= 4:
		print "goal is unreachable!"
	
def callback_extra(state, result):
	rospy.loginfo("Action server is done. State: %s, result: %s" % (str(state), str(result)))
	if state >= 4:
		print "goal is unreachable!"
	soundhandle.say("hello face", voice, volume)
	rospy.sleep(1)

def movebase_client():

   # Create an action client called "move_base" with action definition file "MoveBaseAction"
	global client
	global main_poses
	global extra_poses
 
   # Waits until the action server has started up and started listening for goals.
	client.wait_for_server()

   # Creates a new goal with the MoveBaseGoal constructor
	goal = MoveBaseGoal()
	goal.target_pose.header.frame_id = "map"
	goal.target_pose.header.stamp = rospy.Time.now()

	extra = False
	if len(extra_poses) > 0:
		x,y,w = extra_poses.pop(0)
		extra = True
	else:
		x,y,w = main_poses.pop()

	goal.target_pose.pose.position.x = x
	goal.target_pose.pose.position.y = y

	q = quaternion_from_euler(0,0,w)
	goal.target_pose.pose.orientation.x = q[0]
	goal.target_pose.pose.orientation.y = q[1]
	goal.target_pose.pose.orientation.z = q[2]
	goal.target_pose.pose.orientation.w = q[3]

   # Sends the goal to the action server.
	if extra:
		client.send_goal(goal, done_cb=callback_extra)
	else:
		client.send_goal(goal, done_cb=callback_done)
   # Waits for the server to finish performing the action.
	wait = client.wait_for_result()
   # If the result doesn't arrive, assume the Server is not available
	if not wait:
		rospy.logerr("Action server not available!")
		rospy.signal_shutdown("Action server not available!")
	else:
	# Result of executing the action
		print('goal execution done')
		if extra:
			rospy.sleep(1)
		else:
			rospy.sleep(0.5)

# If the python node is executed as main process (sourced directly)
if __name__ == '__main__':
	print main_poses
	try:
		# Initializes a rospy node to let the SimpleActionClient publish and subscribe
		rospy.init_node('movebase_client_py')
		while len(main_poses) > 0 or len(extra_poses) > 0:
			movebase_client()
	except rospy.ROSInterruptException:
		rospy.loginfo("Navigation test finished.")
