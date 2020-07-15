######################################################
# How to send a Get request in Python without installing
# additional libraries. Code written for task 3.
# NOT a ROS script!
######################################################

import urllib2

# This is the url you should extract from the QR code in the ring
url = 'https://imba.mk-host.com/~vodomatc/MIMI/vicos/a.txt'

# Then we cen get the contents
resp = urllib2.urlopen(url)
text = resp.read()

print text

# Split the text into a list of strings (each string is one line)
lines = text.splitlines()

# Do further processing
for line in lines:
    print line.split(':') # creat new list by splitting the string with the char ':'

