# Adventures-of-Gargamel
This is a group project we made in third year of college in which we had to make a robot that found a wife for Gargamel in a poligon of faces and shapes.
For the robot we used the ROS Kinetic operating system and due to the pandemic we had to use Gazebo to run a simulation of a real-life environment.

## Setup
The robot is first set into a poligon with white walls, that contains cylinders, rings and faces. The cylinders are placed on the ground, the rings hang in the air and the faces(printouts) are taped on the walls.
The robot's objective on this poligon is to find a partner for Gargamel.

## The process
The robot first explores the poligon, of which he has a preprepared map, to detect all the faces and objects and marks them on the map. Everytime he detects an object, he approches it and either recognizes a face and its charateristics, or detects what color a certain object is. After he is done, he goes to Gargamel and asks him what kind of woman he prefers and he gives his answer with his hair preference - long/short and dark/light. After that, the robots approaches a woman with said characteristics and asks what is her favorite color. He then goes to Gargamel and asks if he likes her. If the answer is yes, the robot goes to the cylinder of that color and drops a 'coin' into the 'wishing well' by extending his robotic arm. Then he approaches the ring and 'picks it up' by moving the arm beneath the ring(this was implemented like this, because the year started as normal and we had to switch to a simulation halfway). After this is completed he goes back to the woman and asks her to marry Gargamel. If the answer is yes, the robot is done, otherwise he keeps looking.


## Details on implementation
For more detailed description of each component, I have attached a report on the project in which every aspect of the robot is explained in more detail.

## Running the project
First you need an OS with ROS Kinetic distribution. Place the project into the project file and run catkin make. After that run ROS and Gazebo and watch the robot go.
