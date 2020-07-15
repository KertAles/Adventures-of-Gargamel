// Generated by gencpp from file detection_msgs/Detection.msg
// DO NOT EDIT!


#ifndef DETECTION_MSGS_MESSAGE_DETECTION_H
#define DETECTION_MSGS_MESSAGE_DETECTION_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <std_msgs/Header.h>
#include <sensor_msgs/Image.h>

namespace detection_msgs
{
template <class ContainerAllocator>
struct Detection_
{
  typedef Detection_<ContainerAllocator> Type;

  Detection_()
    : header()
    , x(0)
    , y(0)
    , height(0)
    , width(0)
    , source()
    , label()
    , confidence(0.0)
    , image()  {
    }
  Detection_(const ContainerAllocator& _alloc)
    : header(_alloc)
    , x(0)
    , y(0)
    , height(0)
    , width(0)
    , source(_alloc)
    , label(_alloc)
    , confidence(0.0)
    , image(_alloc)  {
  (void)_alloc;
    }



   typedef  ::std_msgs::Header_<ContainerAllocator>  _header_type;
  _header_type header;

   typedef int32_t _x_type;
  _x_type x;

   typedef int32_t _y_type;
  _y_type y;

   typedef int32_t _height_type;
  _height_type height;

   typedef int32_t _width_type;
  _width_type width;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _source_type;
  _source_type source;

   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _label_type;
  _label_type label;

   typedef float _confidence_type;
  _confidence_type confidence;

   typedef  ::sensor_msgs::Image_<ContainerAllocator>  _image_type;
  _image_type image;





  typedef boost::shared_ptr< ::detection_msgs::Detection_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::detection_msgs::Detection_<ContainerAllocator> const> ConstPtr;

}; // struct Detection_

typedef ::detection_msgs::Detection_<std::allocator<void> > Detection;

typedef boost::shared_ptr< ::detection_msgs::Detection > DetectionPtr;
typedef boost::shared_ptr< ::detection_msgs::Detection const> DetectionConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::detection_msgs::Detection_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::detection_msgs::Detection_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace detection_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': True}
// {'detection_msgs': ['/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/detection/detection_msgs/msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg'], 'visualization_msgs': ['/opt/ros/kinetic/share/visualization_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::detection_msgs::Detection_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::detection_msgs::Detection_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detection_msgs::Detection_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::detection_msgs::Detection_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detection_msgs::Detection_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::detection_msgs::Detection_<ContainerAllocator> const>
  : TrueType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::detection_msgs::Detection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "4d71b1d0f89f927af34e703429c85b29";
  }

  static const char* value(const ::detection_msgs::Detection_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x4d71b1d0f89f927aULL;
  static const uint64_t static_value2 = 0xf34e703429c85b29ULL;
};

template<class ContainerAllocator>
struct DataType< ::detection_msgs::Detection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "detection_msgs/Detection";
  }

  static const char* value(const ::detection_msgs::Detection_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::detection_msgs::Detection_<ContainerAllocator> >
{
  static const char* value()
  {
    return "Header header\n\
int32 x\n\
int32 y\n\
int32 height\n\
int32 width\n\
string source\n\
string label\n\
float32 confidence\n\
sensor_msgs/Image image\n\
\n\
================================================================================\n\
MSG: std_msgs/Header\n\
# Standard metadata for higher-level stamped data types.\n\
# This is generally used to communicate timestamped data \n\
# in a particular coordinate frame.\n\
# \n\
# sequence ID: consecutively increasing ID \n\
uint32 seq\n\
#Two-integer timestamp that is expressed as:\n\
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')\n\
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')\n\
# time-handling sugar is provided by the client library\n\
time stamp\n\
#Frame this data is associated with\n\
# 0: no frame\n\
# 1: global frame\n\
string frame_id\n\
\n\
================================================================================\n\
MSG: sensor_msgs/Image\n\
# This message contains an uncompressed image\n\
# (0, 0) is at top-left corner of image\n\
#\n\
\n\
Header header        # Header timestamp should be acquisition time of image\n\
                     # Header frame_id should be optical frame of camera\n\
                     # origin of frame should be optical center of camera\n\
                     # +x should point to the right in the image\n\
                     # +y should point down in the image\n\
                     # +z should point into to plane of the image\n\
                     # If the frame_id here and the frame_id of the CameraInfo\n\
                     # message associated with the image conflict\n\
                     # the behavior is undefined\n\
\n\
uint32 height         # image height, that is, number of rows\n\
uint32 width          # image width, that is, number of columns\n\
\n\
# The legal values for encoding are in file src/image_encodings.cpp\n\
# If you want to standardize a new string format, join\n\
# ros-users@lists.sourceforge.net and send an email proposing a new encoding.\n\
\n\
string encoding       # Encoding of pixels -- channel meaning, ordering, size\n\
                      # taken from the list of strings in include/sensor_msgs/image_encodings.h\n\
\n\
uint8 is_bigendian    # is this data bigendian?\n\
uint32 step           # Full row length in bytes\n\
uint8[] data          # actual matrix data, size is (step * rows)\n\
";
  }

  static const char* value(const ::detection_msgs::Detection_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::detection_msgs::Detection_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.header);
      stream.next(m.x);
      stream.next(m.y);
      stream.next(m.height);
      stream.next(m.width);
      stream.next(m.source);
      stream.next(m.label);
      stream.next(m.confidence);
      stream.next(m.image);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Detection_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::detection_msgs::Detection_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::detection_msgs::Detection_<ContainerAllocator>& v)
  {
    s << indent << "header: ";
    s << std::endl;
    Printer< ::std_msgs::Header_<ContainerAllocator> >::stream(s, indent + "  ", v.header);
    s << indent << "x: ";
    Printer<int32_t>::stream(s, indent + "  ", v.x);
    s << indent << "y: ";
    Printer<int32_t>::stream(s, indent + "  ", v.y);
    s << indent << "height: ";
    Printer<int32_t>::stream(s, indent + "  ", v.height);
    s << indent << "width: ";
    Printer<int32_t>::stream(s, indent + "  ", v.width);
    s << indent << "source: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.source);
    s << indent << "label: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.label);
    s << indent << "confidence: ";
    Printer<float>::stream(s, indent + "  ", v.confidence);
    s << indent << "image: ";
    s << std::endl;
    Printer< ::sensor_msgs::Image_<ContainerAllocator> >::stream(s, indent + "  ", v.image);
  }
};

} // namespace message_operations
} // namespace ros

#endif // DETECTION_MSGS_MESSAGE_DETECTION_H
