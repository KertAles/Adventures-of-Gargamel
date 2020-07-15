from turtlebot_get_colors import get_colors 
from PIL import Image

PATH = '/home/matevz/Desktop/dataset_color_detection/jpgs/Bela1.jpg' 
#PATH = '/home/matevz/Desktop/dataset_color_detection/colorpic.jpg' 
#PATH = '/home/matevz/Desktop/ylw.jpg' 
image = Image.open(PATH)

print(get_colors(image))