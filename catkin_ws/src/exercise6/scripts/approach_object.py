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
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
import cv2
import matplotlib.pyplot as plt

from tf.transformations import quaternion_from_euler
from sound_play.msg import SoundRequest
from sound_play.libsoundplay import SoundClient
from math import pi
from exercise4.msg import Person
from exercise6.msg import Cylinder
from exercise6.msg import Ring
import pyttsx3
import speech_recognition as sr
import pyaudio
import wave
import phonetics

keywords_color = ["red","blue","green","yellow","black"]
keywords_shade = ["dark", "light"]
keywords_length = ["long", "short"]
keywords_confirm = ["yes", "yeah", "okay", "no", "nope"]

chunk = 1024  # Record in chunks of 1024 samples
sample_format = pyaudio.paInt16  # 16 bits per sample
channels = 2
fs = 44100  # Record at 44100 samples per second
seconds = 4
filename = "output.wav"

p = pyaudio.PyAudio()  # Create an interface to PortAudio

voice = 'voice_kal_diphone'
volume = 1.0
#soundhandle = SoundClient()

def getInput():
	while(True):
		print('Recording input')

		stream = p.open(format=sample_format,
						channels=channels,
						rate=fs,
						frames_per_buffer=chunk,
						input=True)

		frames = []  # Initialize array to store frames

		# Store data in chunks for 3 seconds
		for i in range(0, int(fs / chunk * seconds)):
			data = stream.read(chunk)
			frames.append(data)

		# Stop and close the stream
		stream.stop_stream()
		stream.close()

		print('Finished recording')

		# Save the recorded data as a WAV file
		wf = wave.open(filename, 'wb')
		wf.setnchannels(channels)
		wf.setsampwidth(p.get_sample_size(sample_format))
		wf.setframerate(fs)
		wf.writeframes(b''.join(frames))
		wf.close()

		# Initialize recognizer class (for recognizing the speech)
		r = sr.Recognizer()

		# Reading Audio file as source
		# listening the audio file and store in audio_text variable
		with sr.AudioFile(filename) as source:
			audio_text = r.listen(source)

			# recoginize_() method will throw a request error if the API is unreachable, hence using exception handling
			try:
				# using google speech recognition
				text = r.recognize_google(audio_text)
				print('Converting audio transcripts into text ...')
				text_split = text.split()
				colors = list()
				lengths = list()
				shades = list()

				for word in text_split :
					word_phonetic = phonetics.metaphone(word)

					for color in keywords_color:
						color_phonetic = phonetics.metaphone(color)
						if(word_phonetic == color_phonetic):
							colors.append(color)
							break

					for shade in keywords_shade:
						shade_phonetic = phonetics.metaphone(shade)
						if (word_phonetic == shade_phonetic):
							shades.append(shade)
							break

					for length in keywords_length:
						length_phonetic = phonetics.metaphone(length)
						if (word_phonetic == length_phonetic):
							lengths.append(length)
							break

				print(text)
				print(colors)
				print(lengths)
				print(shades)
				return colors, lengths, shades

			except:
				print('Error. Repeating recording...')
	return []

def getConfirmation(): 
	# Confirm correct input
	while(True):
		print('Recording confirmation')

		stream = p.open(format=sample_format,
						channels=channels,
						rate=fs,
						frames_per_buffer=chunk,
						input=True)

		frames = []  # Initialize array to store frames

		# Store data in chunks for 3 seconds
		for i in range(0, int(fs / chunk * seconds)):
			data = stream.read(chunk)
			frames.append(data)

		# Stop and close the stream
		stream.stop_stream()
		stream.close()

		print('Finished recording')

		# Save the recorded data as a WAV file
		wf = wave.open(filename, 'wb')
		wf.setnchannels(channels)
		wf.setsampwidth(p.get_sample_size(sample_format))
		wf.setframerate(fs)
		wf.writeframes(b''.join(frames))
		wf.close()

		# Initialize recognizer class (for recognizing the speech)
		r = sr.Recognizer()

		# Reading Audio file as source
		# listening the audio file and store in audio_text variable
		with sr.AudioFile(filename) as source:
			audio_text = r.listen(source)

			# recoginize_() method will throw a request error if the API is unreachable, hence using exception handling
			try:

				# using google speech recognition
				text = r.recognize_google(audio_text)
				print('Converting audio transcripts into text ...')
				text_split = text.split()
				confirms = list()

				for word in text_split :
					word_phonetic = phonetics.metaphone(word)

					for confirm in keywords_confirm:
						confirm_phonetic = phonetics.metaphone(confirm)
						if (word_phonetic == confirm_phonetic):
							confirms.append(confirm)
							break
				
				print(text)
				print(confirms)
				return confirms

			except:
				print('Error. Repeating recording...')
	
	return []

# text to speech engine
engine = pyttsx3.init()
engine.setProperty('rate', 125)

people = {}
cylinders = {}
rings = {}


# people = dict([
# (0, {'app_y': 2.950000000000001, 'app_x': -0.09999999999999787, 'hair_len': 'short', 'app_z': 1.559628853994424, 'hair_col': 'dark'}),
# (8, {'app_y': 1.0000000000000018, 'app_x': 1.0500000000000007, 'hair_len': 'short', 'app_z': 3.0500955472105473, 'hair_col': 'dark'}),
# (13, {'app_y': 0.10000000000000142, 'app_x': -0.6999999999999993, 'hair_len': 'long', 'app_z': -1.5925870801373527, 'hair_col': 'light'}),
# (14, {'app_y': -0.049999999999998934, 'app_x': 3.900000000000002, 'hair_len': 'long', 'app_z': -0.26193310572456185, 'hair_col': 'light'}),
# (16, {'app_y': -1.1499999999999986, 'app_x': 0.2500000000000018, 'hair_len': 'long', 'app_z': -1.6431043990462824, 'hair_col': 'dark'}),
# (18, {'app_y': 3.0500000000000007, 'app_x': 1.6500000000000021, 'hair_len': 'short', 'app_z': 1.6201340878249975, 'hair_col': 'light'})])
# cylinders = dict(
# [('blue', {'app_y': 2.3500000000000014, 'app_x': 2.7500000000000018, 'app_z': -0.8726397075584748}),
# ('green', {'app_y': 0.9000000000000021, 'app_x': 0.20000000000000107, 'app_z': -0.8612932283897289}),
# ('red', {'app_y': -1.0999999999999979, 'app_x': 2.1000000000000014, 'app_z': -0.8076147814970743}),
# ('yellow', {'app_y': 0.5000000000000018, 'app_x': 3.0500000000000007, 'app_z': 0.4703031031661485})])
# rings = dict(
# [('blue', {'app_y': 1.950000000000001, 'app_x': 1.2500000000000018, 'app_z': -0.07341224901143294}),
# ('green', {'app_y': 1.1500000000000021, 'app_x': -0.8499999999999979, 'app_z': -2.997272848387601}),
# ('N/A', {'app_y': 1.9000000000000021, 'app_x': -0.4499999999999993, 'app_z': -0.16689539448095347}),
# ('red', {'app_y': 0.5500000000000007, 'app_x': 1.8500000000000014, 'app_z': -1.565233533785518})])
girl_sets = {'dark':{'long':set([]), 'short':set([])},
			 'light':{'long':set([]), 'short':set([])}}

for pl in people:
	if pl != 0:
		person = people[pl]
		girl_sets[person['hair_col']][person['hair_len']].add(pl)
# print(girl_sets)

used_girls = set([])

bridge = CvBridge()
def get_rgb_image():
	try:
		rgb_image_message = rospy.wait_for_message("/camera/rgb/image_raw", Image)
	except Exception as e:
		print(e)
		return None
	try:
		rgb_image = bridge.imgmsg_to_cv2(rgb_image_message, "bgr8")
	except CvBridgeError as e:
		print(e)
		return None
	return rgb_image

def get_depth_image():
	try:
		depth_image_message = rospy.wait_for_message("/camera/depth/image_raw", Image)
	except Exception as e:
		print(e)
		return None
	try:
		depth_image = bridge.imgmsg_to_cv2(depth_image_message, "32FC1")
	except CvBridgeError as e:
		print(e)
		return None
	return depth_image



def person_callback(person):
	# print('[ROS_INFO]: approach node received Person')
	# print(people)
	people[person.id] = {}
	people[person.id]['app_x'] = person.app_x
	people[person.id]['app_y'] = person.app_y
	people[person.id]['app_z'] = person.app_z
	people[person.id]['hair_col'] = person.hair_col
	people[person.id]['hair_len'] = person.hair_len
	if person.id != 0 and person.id not in used_girls:
		girl_sets[person.hair_col][person.hair_len].add(person.id)
	
	# if person.hair_col == 'dark':
	# 	if person.hair_len == 'long':
	# 		dark_long.add(person.id)
	# 	elif person.hair_len == 'short':
	# 		dark_short.add(person.id)
	# elif person.hair_col == 'light':
	# 	if person.hair_len == 'long':
	# 		light_long.add(person.id)
	# 	elif person.hair_len == 'short':
	# 		light_short.add(person.id)

def cylinder_callback(cylinder):
	# print('[ROS_INFO]: approach node received Cylinder')
	# print(cylinders)
	cylinders[cylinder.color] = {}
	cylinders[cylinder.color]['app_x'] = cylinder.app_x
	cylinders[cylinder.color]['app_y'] = cylinder.app_y
	cylinders[cylinder.color]['app_z'] = cylinder.app_z

def ring_callback(ring):
	# print('[ROS_INFO]: approach node received Ring')
	# print(rings)
	rings[ring.color] = {}
	rings[ring.color]['app_x'] = ring.app_x
	rings[ring.color]['app_y'] = ring.app_y
	rings[ring.color]['app_z'] = ring.app_z

# def conversation_callback(conversation):
# 	print('[ROS_INFO]: approach node received Conversation')
# 	if conversation.color:
# 		fav_color = conversation.color
# 	elif conversation.hair_color:
# 		hair_col = conversation.hair_color
# 		hair_len = conversation.hair_length

hair_col = ''
hair_len = ''
fav_color = ''

# commands = ["red", "blue", 'green', "yellow", "black", "white"]
commands = []



extra_pub = rospy.Publisher('extra_pose', Vector3, queue_size=10)
arm_pub = rospy.Publisher('/arm_command', String, queue_size=10)
extra_wait = rospy.Subscriber('extra_finished', String)
twister_pub = rospy.Publisher('/cmd_vel_mux/input/navi', Twist, queue_size=1000, latch=True)
person_sub = rospy.Subscriber('people', Person, callback=person_callback)
cylinder_sub = rospy.Subscriber('cylinders_pos', Cylinder, callback=cylinder_callback)
ring_sub = rospy.Subscriber('rings_pos', Ring, callback=ring_callback)
# conversation_sub = rospy.Subscriber('conversation', Conversation, callback=conversation_callback)

# cylinders = {'Blue':(1.1000000000000014, 0.20000000000000107, -2.166958178286841), 
# 					   'Green':(2.700000000000001, 1.700000000000001, 0.670606744505186), 
# 					   'Yellow':(3.5000000000000018, -0.6499999999999986, -1.2372500826444317), 
# 					   'Red':(-0.7499999999999982, 0.15000000000000213, -2.282840126898248)}

# rings = {'Blue':(1.2500000000000018, 1.950000000000001, -0.059477217417190774), 
# 				  'Green':(-0.9999999999999982, 0.6000000000000014, 2.426925907393322), 
# 				  'Yellow': (-0.4499999999999993, 1.950000000000001, -0.15553691090539845), 
# 				  'Red': (2.3500000000000014, -0.049999999999998934, -3.0244586937825644)}

def approach_objects(color):
   # Creates a new goal with the MoveBaseGoal constructor
	# if color not in cylinders or color not in rings:
	# 	print('not all positions known for color:', color)
	# 	return
	print('doing color', color)
	pose1 = Vector3()
	pose2 = Vector3()
	twist_forward = Twist()
	twist_backward = Twist()
	cylinder_command = String()
	retract_command = String()
	ring_command = String()
	cylinder_command.data = "touch_cylinder"
	ring_command.data = "touch_ring"
	retract_command.data = 'retract'
	twist_forward.linear.x = 0.1
	twist_forward.linear.y = 0.0
	twist_forward.linear.z = 0.0
	twist_forward.angular.x = 0.0
	twist_forward.angular.y = 0.0
	twist_forward.angular.z = 0.0

	twist_backward.linear.x = -0.1
	twist_backward.linear.y = 0.0
	twist_backward.linear.z = 0.0
	twist_backward.angular.x = 0.0
	twist_backward.angular.y = 0.0
	twist_backward.angular.z = 0.0
	pose1.x, pose1.y, pose1.z = cylinders[color]['app_x'], cylinders[color]['app_y'], cylinders[color]['app_z']
	pose2.x, pose2.y, pose2.z = rings[color]['app_x'], rings[color]['app_y'], rings[color]['app_z']
	# pose1.x, pose1.y, pose1.z = cylinders[color][0], cylinders[color][1], cylinders[color][2]
	# pose2.x, pose2.y, pose2.z = rings[color][0], rings[color][1], rings[color][2]

	# go touch cylinder
	if color in cylinders:
		extra_pub.publish(pose1)
		rospy.wait_for_message('extra_finished', String)#wait for extra goal to be reached
		# print('twist_forward')
		d = 10
		count = 0
		while d > 0.42 and count < 10:
			count += 1
			img_d = get_depth_image()
			if img_d is not None:
				h,w = img_d.shape[:2]
				size = 20
				d = np.nanmin(img_d[int(h/2 - size):int(h/2 + size), 0:w-1])
				twister_pub.publish(twist_forward)
				rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.5)
		arm_pub.publish(cylinder_command)
		rospy.sleep(3)
		arm_pub.publish(retract_command)
		# print('twist_backward')
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
		rospy.sleep(0.5)
	else:
		print("[INFO] selected color {} not among cylinders".format(color))

	# go touch ring
	if color in rings:
		extra_pub.publish(pose2)
		rospy.wait_for_message('extra_finished', String) #wait for extra goal to be reached
		d = 10
		count = 0
		while d > 0.42 and count < 10:
			count += 1
			img_d = get_depth_image()
			if img_d is not None:
				h,w = img_d.shape[:2]
				size = 20
				d = np.nanmin(img_d[int(h/2 - size):int(h/2 + size), 0:w-1])
				# print(d)
				twister_pub.publish(twist_forward)
				rospy.sleep(0.3)		
		# print('twist_forward')
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.3)
		# twister_pub.publish(twist_forward)
		# rospy.sleep(0.5)
		arm_pub.publish(ring_command)
		rospy.sleep(3)
		arm_pub.publish(retract_command)
		# print('twist_backward')	
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
		rospy.sleep(0.3)
		twister_pub.publish(twist_backward)
	else:
		print("[INFO] selected color {} not among rings".format(color))
	return


def approach_person(person_id):
	#approach person and wait till finished
	if person_id not in people:
		print('[GAME] person called not in person dictionary!!!')
		return
	pose = Vector3()
	pose.x = people[person_id]['app_x']
	pose.y = people[person_id]['app_y']
	pose.z = people[person_id]['app_z']
	extra_pub.publish(pose)
	rospy.wait_for_message('extra_finished', String)#wait for extra goal to be reached


found = False
def main():
	global found
	if found:
		return
	finish_msg = rospy.wait_for_message('extra_finished', String)
	if finish_msg.data != 'main_finished':
		return
	# find gargamel
	if 0 in people:
		# garg_pose = Vector3()
		# garg_pose.x = people[0]['app_x']
		# garg_pose.y = people[0]['app_y']
		# garg_pose.z = people[0]['app_z']
		# extra_pub.publish(garg_pose)
		# rospy.wait_for_message('extra_finished', String, 100)#wait for extra goal to be reached
		print('[GAME] Approaching [Gargamel]')
		approach_person(0) # approach gargamel
		rgbimg_garg = get_rgb_image()
		# gargamel found
		# fav_hair_col = raw_input('[QUESTION] What is your favourite hair color: ')	
		# fav_hair_len = raw_input('[QUESTION] What is your favourite hair length: ')
		fav_color = []
		fav_hair_len = []
		while len(fav_hair_len) != 1 or len(fav_hair_col) != 1:
			engine.say('What is your favourite hair color and hair length')
			engine.runAndWait()
			print("[QUESTION] What is you favoirte hair color and length?")
			_, fav_hair_len, fav_hair_col = getInput()
			fav_hair_col = fav_hair_col
			fav_hair_len = fav_hair_len
		fav_hair_len = fav_hair_len[0]
		fav_hair_col = fav_hair_col[0]
		# find a fitting girl

		while not found:
			if len(girl_sets[fav_hair_col][fav_hair_len]) > 0:
				girl_id = girl_sets[fav_hair_col][fav_hair_len].pop()
				used_girls.add(girl_id)
			else:
				print('[GAME] no fitting girl found! exiting')
				found = True
				break
			# approach girl and ask for favourite color
			approach_person(girl_id)
			rgbimg_girl = get_rgb_image()
			# fav_color = raw_input('[QUESTION] What is your favourite color: ')
			col = []
			while len(col) != 1:
				print('[QUESTION] What is your favourite color: ')
				engine.say('What is your favourite color?')
				engine.runAndWait()
				col, _, _ = getInput()
			fav_color = col[0]
			print(col)

			# approach gargamel and ask for a girl
			approach_person(0)
			if rgbimg_girl is not None:
				plt.imshow(cv2.cvtColor(rgbimg_girl, cv2.COLOR_BGR2RGB))
				plt.show()
				# cv2.imshow('the_girl', rgbimg_girl)
				# cv2.waitKey(5)
			# i_like_girl = raw_input('[QUESTION] Do you like the girl?: ')
			i_like_girl = []
			while len(i_like_girl) != 1:
				engine.say('Do you like the girl?')
				engine.runAndWait()
				i_like_girl = getConfirmation()
			i_like_girl = i_like_girl[0]

			if i_like_girl == 'no':
				print('[GAME] Gargamel doesn\'t fancy the girl! To the next one!')
				continue
			approach_objects(fav_color)
			approach_person(girl_id)
			#show photo
			if rgbimg_garg is not None:
				plt.imshow(cv2.cvtColor(rgbimg_garg, cv2.COLOR_BGR2RGB))
				plt.show()
				# cv2.imshow('the_fargamel', rgbimg_garg)
				# cv2.waitKey(5)
			# marry_gargamel = raw_input('[QUESTION] Marry Gargamel?: ')
			marry_gargamel = []
			while len(marry_gargamel) != 1:
				engine.say('Marry Gargamel?')
				engine.runAndWait()
				marry_gargamel = getConfirmation()
			marry_gargamel = marry_gargamel[0]
			if marry_gargamel == 'yes':
				print('[GAME OVER] found proper girl for Gargamel')
				found = True
				break
			else:
				print('[GAME] Girl doesn\'t fancy Gargamel! To the next one!')
			

			



		

	

			

# If the python node is executed as main process (sourced directly)
if __name__ == '__main__':
	# print main_poses
	rospy.init_node('approach_object_py')
	rate = rospy.Rate(10)
	try:
		# Initializes a rospy node to let the SimpleActionClient publish and subscribe
		while not rospy.is_shutdown():
			main()
			rate.sleep()
	except rospy.ROSInterruptException:
		rospy.loginfo("Navigation test finished.")
		print('people:')
		for p in people:
			print(p, people[p])
		print('cylinders:')
		for c in cylinders:
			print(c, cylinders[c])
		print('rings:')
		for r in rings:
			print(r, rings[r])