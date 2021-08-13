// Generated by gencpp from file config/param.msg
// DO NOT EDIT!


#ifndef CONFIG_MESSAGE_PARAM_H
#define CONFIG_MESSAGE_PARAM_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace config
{
template <class ContainerAllocator>
struct param_
{
  typedef param_<ContainerAllocator> Type;

  param_()
    : NMS_THRESH(0.0)
    , CONF_THRESH(0.0)
    , k_volleyball(0)
    , k_basketball(0)
    , k_basket(0)
    , k_mark(0)
    , if_shot(false)
    , if_show(false)  {
    }
  param_(const ContainerAllocator& _alloc)
    : NMS_THRESH(0.0)
    , CONF_THRESH(0.0)
    , k_volleyball(0)
    , k_basketball(0)
    , k_basket(0)
    , k_mark(0)
    , if_shot(false)
    , if_show(false)  {
  (void)_alloc;
    }



   typedef float _NMS_THRESH_type;
  _NMS_THRESH_type NMS_THRESH;

   typedef float _CONF_THRESH_type;
  _CONF_THRESH_type CONF_THRESH;

   typedef int32_t _k_volleyball_type;
  _k_volleyball_type k_volleyball;

   typedef int32_t _k_basketball_type;
  _k_basketball_type k_basketball;

   typedef int32_t _k_basket_type;
  _k_basket_type k_basket;

   typedef int32_t _k_mark_type;
  _k_mark_type k_mark;

   typedef uint8_t _if_shot_type;
  _if_shot_type if_shot;

   typedef uint8_t _if_show_type;
  _if_show_type if_show;





  typedef boost::shared_ptr< ::config::param_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::config::param_<ContainerAllocator> const> ConstPtr;

}; // struct param_

typedef ::config::param_<std::allocator<void> > param;

typedef boost::shared_ptr< ::config::param > paramPtr;
typedef boost::shared_ptr< ::config::param const> paramConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::config::param_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::config::param_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::config::param_<ContainerAllocator1> & lhs, const ::config::param_<ContainerAllocator2> & rhs)
{
  return lhs.NMS_THRESH == rhs.NMS_THRESH &&
    lhs.CONF_THRESH == rhs.CONF_THRESH &&
    lhs.k_volleyball == rhs.k_volleyball &&
    lhs.k_basketball == rhs.k_basketball &&
    lhs.k_basket == rhs.k_basket &&
    lhs.k_mark == rhs.k_mark &&
    lhs.if_shot == rhs.if_shot &&
    lhs.if_show == rhs.if_show;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::config::param_<ContainerAllocator1> & lhs, const ::config::param_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace config

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::config::param_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::config::param_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::config::param_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::config::param_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::config::param_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::config::param_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::config::param_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d68603a995f522ff42920316e8f8368";
  }

  static const char* value(const ::config::param_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d68603a995f522fULL;
  static const uint64_t static_value2 = 0xf42920316e8f8368ULL;
};

template<class ContainerAllocator>
struct DataType< ::config::param_<ContainerAllocator> >
{
  static const char* value()
  {
    return "config/param";
  }

  static const char* value(const ::config::param_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::config::param_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float32 NMS_THRESH\n"
"float32 CONF_THRESH\n"
"int32 k_volleyball\n"
"int32 k_basketball\n"
"int32 k_basket\n"
"int32 k_mark\n"
"bool if_shot\n"
"bool if_show\n"
;
  }

  static const char* value(const ::config::param_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::config::param_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.NMS_THRESH);
      stream.next(m.CONF_THRESH);
      stream.next(m.k_volleyball);
      stream.next(m.k_basketball);
      stream.next(m.k_basket);
      stream.next(m.k_mark);
      stream.next(m.if_shot);
      stream.next(m.if_show);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct param_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::config::param_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::config::param_<ContainerAllocator>& v)
  {
    s << indent << "NMS_THRESH: ";
    Printer<float>::stream(s, indent + "  ", v.NMS_THRESH);
    s << indent << "CONF_THRESH: ";
    Printer<float>::stream(s, indent + "  ", v.CONF_THRESH);
    s << indent << "k_volleyball: ";
    Printer<int32_t>::stream(s, indent + "  ", v.k_volleyball);
    s << indent << "k_basketball: ";
    Printer<int32_t>::stream(s, indent + "  ", v.k_basketball);
    s << indent << "k_basket: ";
    Printer<int32_t>::stream(s, indent + "  ", v.k_basket);
    s << indent << "k_mark: ";
    Printer<int32_t>::stream(s, indent + "  ", v.k_mark);
    s << indent << "if_shot: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.if_shot);
    s << indent << "if_show: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.if_show);
  }
};

} // namespace message_operations
} // namespace ros

#endif // CONFIG_MESSAGE_PARAM_H
