import cv2
import numpy as np
from math import pi
# read image through command line
img = cv2.imread("task2_map.png", 0)
img0 = img
img[img<230] = 0
img[img>=230] = 255
kernel = np.ones((5,5))
img = cv2.erode(img, kernel, iterations=4)
img[5::30,:] = 0
img[:,13::35] = 0
img = cv2.threshold(img, 127, 255, cv2.THRESH_BINARY)[1]
img_inflate = img
# cv2.imshow("Image", img)
# cv2.waitKey(0)

#connected components
num_labels, labels_im = cv2.connectedComponents(img)
centers = []
for i in range(num_labels):
	data = np.argwhere(labels_im==i)
	average = [sum(x)/len(x) for x in zip(*data)]
	img0[average[0],average[1]] = 0
	centers.append([average[1], average[0], 0])
	centers.append([average[1], average[0], 0])
	centers.append([average[1], average[0], 0])
	centers.append([average[1], average[0], 0])
centers = np.array(centers, dtype=float)
# centers[:,0] = (centers[:,0] - 265) / 20.0
# centers[:,1] = (centers[:,1] - 250) / 20.

centers[:,0] = centers[:,0] * 0.05 - 12.2
centers[:,1] = (512.0 - centers[:,1]) * 0.05 - 12.2
centers[0::4,2] = 0.0
centers[1::4,2] = pi/2.0
centers[2::4,2] = pi 
centers[3::4,2] = 3*pi/2.0
np.savetxt('centers.txt', centers, fmt='%.2f')
# img0[265, 250] = 0
cv2.imshow("slika", img_inflate)

cv2.waitKey(0)
cv2.imshow("slika2", img0)
cv2.waitKey(0)
cv2.imwrite('img_inflate.png', img_inflate)
cv2.imwrite('dots.png', img0)
# cv2.imshow("con", labels_im)
# cv2.waitKey(0)
# # convert the image to grayscale
# def imshow_components(labels):
#     # Map component labels to hue val
#     label_hue = np.uint8(179*labels/np.max(labels))
#     blank_ch = 255*np.ones_like(label_hue)
#     labeled_img = cv2.merge([label_hue, blank_ch, blank_ch])

#     # cvt to BGR for display
#     labeled_img = cv2.cvtColor(labeled_img, cv2.COLOR_HSV2BGR)

#     # set bg label to black
#     labeled_img[label_hue==0] = 0

#     cv2.imshow('labeled.png', labeled_img)
#     cv2.waitKey()

# imshow_components(labels_im)
print(num_labels)