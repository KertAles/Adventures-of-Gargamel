#!/usr/bin/env python
import rospy
from std_msgs.msg import String
from vaja01.msg import string_ID

def callback(data):
    rospy.loginfo('you said \"{}\" with id: {}\n'.format(data.content, data.seqID))

def subscribe():

    # In ROS, nodes are uniquely named. If two nodes with the same
    # name are launched, the previous one is kicked off. The
    # anonymous=True flag means that rospy will choose a unique
    # name for our 'listener' node so that multiple listeners can
    # run simultaneously.
    
    rospy.init_node('subscriber')
    r = rospy.Rate(1)

    rospy.Subscriber('chatter', string_ID, callback)
    r.sleep()
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

if __name__ == '__main__':
    subscribe()