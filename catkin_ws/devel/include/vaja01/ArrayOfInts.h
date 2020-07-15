// Generated by gencpp from file vaja01/ArrayOfInts.msg
// DO NOT EDIT!


#ifndef VAJA01_MESSAGE_ARRAYOFINTS_H
#define VAJA01_MESSAGE_ARRAYOFINTS_H

#include <ros/service_traits.h>


#include <vaja01/ArrayOfIntsRequest.h>
#include <vaja01/ArrayOfIntsResponse.h>


namespace vaja01
{

struct ArrayOfInts
{

typedef ArrayOfIntsRequest Request;
typedef ArrayOfIntsResponse Response;
Request request;
Response response;

typedef Request RequestType;
typedef Response ResponseType;

}; // struct ArrayOfInts
} // namespace vaja01


namespace ros
{
namespace service_traits
{


template<>
struct MD5Sum< ::vaja01::ArrayOfInts > {
  static const char* value()
  {
    return "9f68a5f63056c0474865224eaf043dcb";
  }

  static const char* value(const ::vaja01::ArrayOfInts&) { return value(); }
};

template<>
struct DataType< ::vaja01::ArrayOfInts > {
  static const char* value()
  {
    return "vaja01/ArrayOfInts";
  }

  static const char* value(const ::vaja01::ArrayOfInts&) { return value(); }
};


// service_traits::MD5Sum< ::vaja01::ArrayOfIntsRequest> should match 
// service_traits::MD5Sum< ::vaja01::ArrayOfInts > 
template<>
struct MD5Sum< ::vaja01::ArrayOfIntsRequest>
{
  static const char* value()
  {
    return MD5Sum< ::vaja01::ArrayOfInts >::value();
  }
  static const char* value(const ::vaja01::ArrayOfIntsRequest&)
  {
    return value();
  }
};

// service_traits::DataType< ::vaja01::ArrayOfIntsRequest> should match 
// service_traits::DataType< ::vaja01::ArrayOfInts > 
template<>
struct DataType< ::vaja01::ArrayOfIntsRequest>
{
  static const char* value()
  {
    return DataType< ::vaja01::ArrayOfInts >::value();
  }
  static const char* value(const ::vaja01::ArrayOfIntsRequest&)
  {
    return value();
  }
};

// service_traits::MD5Sum< ::vaja01::ArrayOfIntsResponse> should match 
// service_traits::MD5Sum< ::vaja01::ArrayOfInts > 
template<>
struct MD5Sum< ::vaja01::ArrayOfIntsResponse>
{
  static const char* value()
  {
    return MD5Sum< ::vaja01::ArrayOfInts >::value();
  }
  static const char* value(const ::vaja01::ArrayOfIntsResponse&)
  {
    return value();
  }
};

// service_traits::DataType< ::vaja01::ArrayOfIntsResponse> should match 
// service_traits::DataType< ::vaja01::ArrayOfInts > 
template<>
struct DataType< ::vaja01::ArrayOfIntsResponse>
{
  static const char* value()
  {
    return DataType< ::vaja01::ArrayOfInts >::value();
  }
  static const char* value(const ::vaja01::ArrayOfIntsResponse&)
  {
    return value();
  }
};

} // namespace service_traits
} // namespace ros

#endif // VAJA01_MESSAGE_ARRAYOFINTS_H
