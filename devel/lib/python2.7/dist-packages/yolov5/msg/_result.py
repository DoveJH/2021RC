# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from yolov5/result.msg. Do not edit."""
import codecs
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct


class result(genpy.Message):
  _md5sum = "043d72adf347ac3893fd75771296e418"
  _type = "yolov5/result"
  _has_header = False  # flag to mark the presence of a Header object
  _full_text = """float32 bbox0
float32 bbox1
float32 bbox2
float32 bbox3
float32 conf
float32 class_id"""
  __slots__ = ['bbox0','bbox1','bbox2','bbox3','conf','class_id']
  _slot_types = ['float32','float32','float32','float32','float32','float32']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       bbox0,bbox1,bbox2,bbox3,conf,class_id

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(result, self).__init__(*args, **kwds)
      # message fields cannot be None, assign default values for those that are
      if self.bbox0 is None:
        self.bbox0 = 0.
      if self.bbox1 is None:
        self.bbox1 = 0.
      if self.bbox2 is None:
        self.bbox2 = 0.
      if self.bbox3 is None:
        self.bbox3 = 0.
      if self.conf is None:
        self.conf = 0.
      if self.class_id is None:
        self.class_id = 0.
    else:
      self.bbox0 = 0.
      self.bbox1 = 0.
      self.bbox2 = 0.
      self.bbox3 = 0.
      self.conf = 0.
      self.class_id = 0.

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_get_struct_6f().pack(_x.bbox0, _x.bbox1, _x.bbox2, _x.bbox3, _x.conf, _x.class_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 24
      (_x.bbox0, _x.bbox1, _x.bbox2, _x.bbox3, _x.conf, _x.class_id,) = _get_struct_6f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_get_struct_6f().pack(_x.bbox0, _x.bbox1, _x.bbox2, _x.bbox3, _x.conf, _x.class_id))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(locals().get('_x', self)))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(locals().get('_x', self)))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    if python3:
      codecs.lookup_error("rosmsg").msg_type = self._type
    try:
      end = 0
      _x = self
      start = end
      end += 24
      (_x.bbox0, _x.bbox1, _x.bbox2, _x.bbox3, _x.conf, _x.class_id,) = _get_struct_6f().unpack(str[start:end])
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e)  # most likely buffer underfill

_struct_I = genpy.struct_I
def _get_struct_I():
    global _struct_I
    return _struct_I
_struct_6f = None
def _get_struct_6f():
    global _struct_6f
    if _struct_6f is None:
        _struct_6f = struct.Struct("<6f")
    return _struct_6f
