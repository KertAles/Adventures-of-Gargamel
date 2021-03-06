// Generated by gencpp from file vaja01/ArrayOfIntsRequest.msg
// DO NOT EDIT!


#ifndef VAJA01_MESSAGE_ARRAYOFINTSREQUEST_H
#define VAJA01_MESSAGE_ARRAYOFINTSREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace vaja01
{
template <class ContainerAllocator>
struct ArrayOfIntsRequest_
{
  typedef ArrayOfIntsRequest_<ContainerAllocator> Type;

  ArrayOfIntsRequest_()
    : vrsta()  {
      vrsta.assign(0);
  }
  ArrayOfIntsRequest_(const ContainerAllocator& _alloc)
    : vrsta()  {
  (void)_alloc;
      vrsta.assign(0);
  }



   typedef boost::array<int64_t, 10>  _vrsta_type;
  _vrsta_type vrsta;





  typedef boost::shared_ptr< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> const> ConstPtr;

}; // struct ArrayOfIntsRequest_

typedef ::vaja01::ArrayOfIntsRequest_<std::allocator<void> > ArrayOfIntsRequest;

typedef boost::shared_ptr< ::vaja01::ArrayOfIntsRequest > ArrayOfIntsRequestPtr;
typedef boost::shared_ptr< ::vaja01::ArrayOfIntsRequest const> ArrayOfIntsRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace vaja01

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': True, 'IsMessage': True, 'HasHeader': False}
// {'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'vaja01': ['/home/avrelij/Documents/RINS/catkin_ws/src/vaja01/msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "b27f4ee2f5f9a6fe51b04f51349bc9d5";
  }

  static const char* value(const ::vaja01::ArrayOfIntsRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xb27f4ee2f5f9a6feULL;
  static const uint64_t static_value2 = 0x51b04f51349bc9d5ULL;
};

template<class ContainerAllocator>
struct DataType< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "vaja01/ArrayOfIntsRequest";
  }

  static const char* value(const ::vaja01::ArrayOfIntsRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64[10] vrsta\n\
";
  }

  static const char* value(const ::vaja01::ArrayOfIntsRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.vrsta);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct ArrayOfIntsRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::vaja01::ArrayOfIntsRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::vaja01::ArrayOfIntsRequest_<ContainerAllocator>& v)
  {
    s << indent << "vrsta[]" << std::endl;
    for (size_t i = 0; i < v.vrsta.size(); ++i)
    {
      s << indent << "  vrsta[" << i << "]: ";
      Printer<int64_t>::stream(s, indent + "  ", v.vrsta[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // VAJA01_MESSAGE_ARRAYOFINTSREQUEST_H
