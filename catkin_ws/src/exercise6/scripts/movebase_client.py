#!/usr/bin/env python

import rospy
import numpy as np
# Brings in the SimpleActionClient
import actionlib
# Brings in the .action file and messages used by the move base action
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from geometry_msgs.msg import Vector3
from geometry_msgs.msg import Twist
from std_msgs.msg import String

from tf.transformations import quaternion_from_euler
from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient
from math import pi

# main_poses = [ (4.5,1.2,4.3), (5.5,1.0,4.6), (5.5,1.4,0.1), (5.0,2.4,1.6), (4.0,2.0,1.6), (2.5,3.0,1.6), (3.0, 0.0, 1.6)] #zacetna navigacija po mapi
# main_poses = [(3.0, 0.0, 1.6),
# 				(4.1,1.0,0.0+1./2*pi), (4.1,1.0,0.2+3./2*pi), 
# 				(5.4, 1.2, 0.3),(5.4, 1.2, 0.0), (5.4, 1.2, 0.1 - 1./2 * pi),
# 				(5.3, 2.0, 0.1 + 1./2 * pi),(5.3, 2.0, 0.1 + 0./2 * pi),
# 				(4.0,2.2,0.2+1./2*pi), (4.0,2.2,0.0-1./2*pi),
# 				(2.5,3.2,0.1+1./2*pi), (2.5,3.2,0.1+0./2*pi), (2.5,3.2,0.1+5./4*pi), (2.5,3.2,0.1+2./2*pi), 
# 				(3.0, 1.5, 0.1+ 3.0/4 * pi),(3.0, 1.5, 0.1+ 5.0/4 * pi),
# 				(3.0, 0.0, 1.6)]
eps = 0.1
main_poses = np.ndarray.tolist(np.loadtxt('/home/avrelij/Documents/RINS/catkin_ws/src/exercise6/scripts/centers.txt', delimiter=" "))
# main_poses.append((1.5, 2.5, 0))
# main_poses.append((1.5, 2.5, pi/2))
# main_poses.append((1.5, 2.5, pi))
# main_poses.append((1.5, 2.5, 3*pi/4))

top_four = []
current_p = [0.0,0.0,0.0]


extra_poses = [] #te tocke se dodajo sproti
# extra_poses = [(0, (2.1000000000000014, 3.0500000000000007, 1.6582204025808294)), (5, (0.20000000000000107, 0.5500000000000007, -0.1583002932906285)), (8, (1.0500000000000007, 1.3000000000000007, 3.087851521559192)), (9, (-1.3999999999999986, 0.15000000000000213, -3.014280489253948)), (16, (1.0500000000000007, 0.15000000000000213, -1.5630564419320516)), (20, (2.7500000000000018, 1.5000000000000018, 0.1193449911266489))]
extra_poses = [el[1] for el in extra_poses]
twist_moves = []
# main_poses = []
wait = False
x = 0.0
y = 0.0
w = 1.0

# voice = 'voice_kal_diphone'
# volume = 1.0
soundhandle = SoundClient()

client = actionlib.SimpleActionClient('move_base',MoveBaseAction)

finish_msg = String()
main_finished = String()
main_start = String()
finish_msg.data = 'finished'
main_finished.data = 'main_finished'
main_start.data = 'main_started'

region = None
# region = [(0.5, 100), (1, 3)]
main_len = len(main_poses)
main_count = 0


def find_next_point():
	global current_p, main_count
	global top_four
	global main_poses

	# if len(top_four) == 0:
	# 	values = np.array(main_poses)
	# 	diff = np.linalg.norm((current_p[:2] - values[:,:2]), axis=1)
	# 	ranks = sorted(list(enumerate(diff)), key=lambda x:x[1])
	# 	top_four = [main_poses[el[0]] for el in ranks[:min(len(main_poses), 10)]]
	# 	main_poses = [main_poses[el[0]] for el in ranks[min(len(main_poses), 10):]]

	min_d = 10000.0
	min_idx = 0
	for i, point in enumerate(main_poses):
		new_d = (current_p[0] - point[0])**2 + (current_p[1] - point[1])**2
		if new_d < min_d:
			min_d = new_d
			min_idx = i
	current_p = main_poses[min_idx]
	new_point = main_poses.pop(min_idx)
	main_count += 1

	return new_point


def twist_callback(tw):
	twist_moves.append(tw)
	print("got twist move")


twister_pubs = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=10)
twister_sub = rospy.Subscriber('twister', Twist, callback=twist_callback)


def pose_callback(pose):
	#pose.z je ubistvu kot rotacije v ravnini x/y
	extra_poses.append((pose.x, pose.y, pose.z))
	print('got new extra pose')
	print(extra_poses)


extra_finished = rospy.Publisher('extra_finished', String, queue_size=1)
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
	else:
		extra_finished.publish(finish_msg)
	# soundhandle.say("hello face", voice, volume)

def movebase_client():
	global main_count, main_len
	# print(main_count, main_len)
   # Create an action client called "move_base" with action definition file "MoveBaseAction"
	global client
	global main_poses
	global extra_poses
 
   # Waits until the action server has started up and started listening for goals.
	client.wait_for_server()

   # wait if needed, for object marking
   	# try:
	# 	wait = rospy.wait_for_message("waiter", Odometry)
    # except Exception as e:
    #     print(e)
    #     return 0
	# if wait = "wait":
	# 	rospy.sleep(1)

   # Creates a new goal with the MoveBaseGoal constructor
	goal = MoveBaseGoal()
	goal.target_pose.header.frame_id = "map"
	goal.target_pose.header.stamp = rospy.Time.now()

	extra = False
	if len(twist_moves) > 0:
		new_t = twist_moves.pop(0)
		twister_pubs.publish(new_t)
		rospy.sleep(0.5)
		return
	if len(extra_poses) > 0:
		x,y,w = extra_poses.pop(0)
		extra = True
	elif len(main_poses) > 0 or len(top_four) > 0:
		x,y,w = find_next_point()
		if region is not None:
			if x < region[0][0] or x > region[0][1] or y < region[1][0] or y > region[1][1]:
				return
	elif len(main_poses) == 0 and len(top_four) == 0:
		extra_finished.publish(main_finished)
		return
	else:
		return


	if extra:
		print('new extra goal', (x, y, w))
	else:
		print('new main goal', (x, y, w))

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
			rospy.sleep(2)
		else:
			rospy.sleep(0.5)
		
			

# If the python node is executed as main process (sourced directly)
if __name__ == '__main__':
	# print main_poses
	rospy.init_node('movebase_client_py')
	rate = rospy.Rate(10)
	try:
		# Initializes a rospy node to let the SimpleActionClient publish and subscribe
		while not rospy.is_shutdown():
			movebase_client()
			rate.sleep()
	except rospy.ROSInterruptException:
		rospy.loginfo("Navigation test finished.")
