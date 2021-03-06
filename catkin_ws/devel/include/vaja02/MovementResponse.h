// Generated by gencpp from file vaja02/MovementResponse.msg
// DO NOT EDIT!


#ifndef VAJA02_MESSAGE_MOVEMENTRESPONSE_H
#define VAJA02_MESSAGE_MOVEMENTRESPONSE_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vaja02
{
template <class ContainerAllocator>
struct MovementResponse_
{
  typedef MovementResponse_<ContainerAllocator> Type;

  MovementResponse_()
    : shape()  {
    }
  MovementResponse_(const ContainerAllocator& _alloc)
    : shape(_alloc)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _shape_type;
  _shape_type shape;





  typedef boost::shared_ptr< ::vaja02::MovementResponse_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vaja02::MovementResponse_<ContainerAllocator> const> ConstPtr;

}; // struct MovementResponse_

typedef ::vaja02::MovementResponse_<std::allocator<void> > MovementResponse;

typedef boost::shared_ptr< ::vaja02::MovementResponse > MovementResponsePtr;
typedef boost::shared_ptr< ::vaja02::MovementResponse const> MovementResponseConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vaja02::MovementResponse_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vaja02::MovementResponse_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace vaja02

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::vaja02::MovementResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vaja02::MovementResponse_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vaja02::MovementResponse_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vaja02::MovementResponse_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vaja02::MovementResponse_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vaja02::MovementResponse_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vaja02::MovementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fa50c30980f0f012451f487eb6d76d53";
  }

  static const char* value(const ::vaja02::MovementResponse_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xfa50c30980f0f012ULL;
  static const uint64_t static_value2 = 0x451f487eb6d76d53ULL;
};

template<class ContainerAllocator>
struct DataType< ::vaja02::MovementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vaja02/MovementResponse";
  }

  static const char* value(const ::vaja02::MovementResponse_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vaja02::MovementResponse_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string shape\n\
";
  }

  static const char* value(const ::vaja02::MovementResponse_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vaja02::MovementResponse_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.shape);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct MovementResponse_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vaja02::MovementResponse_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vaja02::MovementResponse_<ContainerAllocator>& v)
  {
    s << indent << "shape: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.shape);
  }
};

} // namespace message_operations
} // namespace ros

#endif // VAJA02_MESSAGE_MOVEMENTRESPONSE_H
