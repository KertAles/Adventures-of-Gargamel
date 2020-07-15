// Generated by gencpp from file costmap_layers/Wall.msg
// DO NOT EDIT!


#ifndef COSTMAP_LAYERS_MESSAGE_WALL_H
#define COSTMAP_LAYERS_MESSAGE_WALL_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Point.h>
#include <geometry_msgs/Point.h>

namespace costmap_layers
{
template <class ContainerAllocator>
struct Wall_
{
  typedef Wall_<ContainerAllocator> Type;

  Wall_()
    : identifier()
    , from()
    , to()
    , width(0)  {
    }
  Wall_(const ContainerAllocator& _alloc)
    : identifier(_alloc)
    , from(_alloc)
    , to(_alloc)
    , width(0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _identifier_type;
  _identifier_type identifier;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _from_type;
  _from_type from;

   typedef  ::geometry_msgs::Point_<ContainerAllocator>  _to_type;
  _to_type to;

   typedef int32_t _width_type;
  _width_type width;





  typedef boost::shared_ptr< ::costmap_layers::Wall_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::costmap_layers::Wall_<ContainerAllocator> const> ConstPtr;

}; // struct Wall_

typedef ::costmap_layers::Wall_<std::allocator<void> > Wall;

typedef boost::shared_ptr< ::costmap_layers::Wall > WallPtr;
typedef boost::shared_ptr< ::costmap_layers::Wall const> WallConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::costmap_layers::Wall_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::costmap_layers::Wall_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace costmap_layers

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'costmap_layers': ['/home/avrelij/Documents/RINS/catkin_ws/src/vicos_ros/navigation/costmap_layers/msg'], 'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::costmap_layers::Wall_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::costmap_layers::Wall_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costmap_layers::Wall_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::costmap_layers::Wall_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costmap_layers::Wall_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::costmap_layers::Wall_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::costmap_layers::Wall_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68c0f9e0fd6bb3eb2070700be3dd1d6a";
  }

  static const char* value(const ::costmap_layers::Wall_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68c0f9e0fd6bb3ebULL;
  static const uint64_t static_value2 = 0x2070700be3dd1d6aULL;
};

template<class ContainerAllocator>
struct DataType< ::costmap_layers::Wall_<ContainerAllocator> >
{
  static const char* value()
  {
    return "costmap_layers/Wall";
  }

  static const char* value(const ::costmap_layers::Wall_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::costmap_layers::Wall_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string identifier\n\
geometry_msgs/Point from\n\
geometry_msgs/Point to\n\
int32 width\n\
\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
";
  }

  static const char* value(const ::costmap_layers::Wall_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::costmap_layers::Wall_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.identifier);
      stream.next(m.from);
      stream.next(m.to);
      stream.next(m.width);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct Wall_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::costmap_layers::Wall_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::costmap_layers::Wall_<ContainerAllocator>& v)
  {
    s << indent << "identifier: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.identifier);
    s << indent << "from: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.from);
    s << indent << "to: ";
    s << std::endl;
    Printer< ::geometry_msgs::Point_<ContainerAllocator> >::stream(s, indent + "  ", v.to);
    s << indent << "width: ";
    Printer<int32_t>::stream(s, indent + "  ", v.width);
  }
};

} // namespace message_operations
} // namespace ros

#endif // COSTMAP_LAYERS_MESSAGE_WALL_H