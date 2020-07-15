import os
import colorsys
import numpy as np
from PIL import Image
from collections import Counter
from sklearn.cluster import MiniBatchKMeans

# Meta variables
WIDTH = 128
HEIGHT = 128
CLUSTERS = 12

def getGeneralColor(R,G,B):
        Rout, Gout, Bout = [x/255.0 for x in (R, G, B)]
        hue, lgt, sat = colorsys.rgb_to_hls(Rout, Gout, Bout)

        if lgt < 0.1:
            return "N/A"
        if lgt > 0.9:
            return "N/A"

        if sat < 0.15:
            return "N/A"

        if hue < 0.07:
            return "red"
        if hue < 0.20:
            return "yellow"
        if hue < 0.44:
            return "green"
        if hue < 0.70: 
            return "blue"
        return "red"

# Resize image
def calculate_new_size(image):
    if image.width >= image.height:
        wpercent = (WIDTH / float(image.width))
        hsize = int((float(image.height) * float(wpercent)))
        if hsize == 0:
            hsize = 1
        
        new_width, new_height = WIDTH, hsize
    else:
        hpercent = (HEIGHT / float(image.height))
        wsize = int((float(image.width) * float(hpercent)))
        if wsize == 0:
            wsize = 1
        new_width, new_height = wsize, HEIGHT
    return new_width, new_height

def getGeneralPlotData(general_color_names, label_counts):
        na = r = y = g = b = 0
        i = 0

        for name in general_color_names:
            if name == "red":
                r += label_counts[i]
            if name == "yellow":
                y += label_counts[i]
            if name == "green":
                g += label_counts[i]
            if name == "blue":
                b += label_counts[i] 
            if name == "N/A":
                na += label_counts[i]  
            i += 1

        color = [[[1,0,0] , r, "red"], [[1,1,0], y, "yellow"], [[0,1,0], g, "green"], [[0,0,1], b, "blue"]]

        if (r == y == g == b == 0):
            color.append([[0,0,0], na, "N/A"])

        color_code, value, color_name = max(color, key=lambda item: item[1])

        return [color_code, color_name]

def get_colors(image):
    calculate_new_size(image)
    new_width, new_height = calculate_new_size(image)
    image.resize((new_width, new_height), Image.ANTIALIAS)
    image = image.resize((new_width, new_height), Image.ANTIALIAS)

    # Creating the numpy arrays
    img_array = np.array(image)
    img_vector = img_array.reshape((img_array.shape[0] * img_array.shape[1], 3))

    # Create the model and train it
    model = MiniBatchKMeans(n_clusters=CLUSTERS)
    labels = model.fit_predict(img_vector)
    label_counts = Counter(labels)

    general_color_names = []

    # Get RGB values of colors and find their names
    for center in model.cluster_centers_:
        R = center[0]
        G = center[1]
        B = center[2]

        general_color_names.append(getGeneralColor(R,G,B))  

    return getGeneralPlotData(general_color_names, label_counts)