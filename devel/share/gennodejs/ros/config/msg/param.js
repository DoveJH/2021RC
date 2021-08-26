// Auto-generated. Do not edit!

// (in-package config.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class param {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.NMS_THRESH = null;
      this.CONF_THRESH = null;
      this.k_volleyball = null;
      this.k_basketball = null;
      this.k_basket = null;
      this.k_mark = null;
      this.if_shot = null;
      this.if_show = null;
      this.k_x0 = null;
      this.k_y0 = null;
      this.k_z0 = null;
      this.k_x1 = null;
      this.k_y1 = null;
      this.k_z1 = null;
      this.k_test = null;
    }
    else {
      if (initObj.hasOwnProperty('NMS_THRESH')) {
        this.NMS_THRESH = initObj.NMS_THRESH
      }
      else {
        this.NMS_THRESH = 0.0;
      }
      if (initObj.hasOwnProperty('CONF_THRESH')) {
        this.CONF_THRESH = initObj.CONF_THRESH
      }
      else {
        this.CONF_THRESH = 0.0;
      }
      if (initObj.hasOwnProperty('k_volleyball')) {
        this.k_volleyball = initObj.k_volleyball
      }
      else {
        this.k_volleyball = 0;
      }
      if (initObj.hasOwnProperty('k_basketball')) {
        this.k_basketball = initObj.k_basketball
      }
      else {
        this.k_basketball = 0.0;
      }
      if (initObj.hasOwnProperty('k_basket')) {
        this.k_basket = initObj.k_basket
      }
      else {
        this.k_basket = 0;
      }
      if (initObj.hasOwnProperty('k_mark')) {
        this.k_mark = initObj.k_mark
      }
      else {
        this.k_mark = 0;
      }
      if (initObj.hasOwnProperty('if_shot')) {
        this.if_shot = initObj.if_shot
      }
      else {
        this.if_shot = false;
      }
      if (initObj.hasOwnProperty('if_show')) {
        this.if_show = initObj.if_show
      }
      else {
        this.if_show = false;
      }
      if (initObj.hasOwnProperty('k_x0')) {
        this.k_x0 = initObj.k_x0
      }
      else {
        this.k_x0 = 0.0;
      }
      if (initObj.hasOwnProperty('k_y0')) {
        this.k_y0 = initObj.k_y0
      }
      else {
        this.k_y0 = 0.0;
      }
      if (initObj.hasOwnProperty('k_z0')) {
        this.k_z0 = initObj.k_z0
      }
      else {
        this.k_z0 = 0.0;
      }
      if (initObj.hasOwnProperty('k_x1')) {
        this.k_x1 = initObj.k_x1
      }
      else {
        this.k_x1 = 0.0;
      }
      if (initObj.hasOwnProperty('k_y1')) {
        this.k_y1 = initObj.k_y1
      }
      else {
        this.k_y1 = 0.0;
      }
      if (initObj.hasOwnProperty('k_z1')) {
        this.k_z1 = initObj.k_z1
      }
      else {
        this.k_z1 = 0.0;
      }
      if (initObj.hasOwnProperty('k_test')) {
        this.k_test = initObj.k_test
      }
      else {
        this.k_test = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type param
    // Serialize message field [NMS_THRESH]
    bufferOffset = _serializer.float32(obj.NMS_THRESH, buffer, bufferOffset);
    // Serialize message field [CONF_THRESH]
    bufferOffset = _serializer.float32(obj.CONF_THRESH, buffer, bufferOffset);
    // Serialize message field [k_volleyball]
    bufferOffset = _serializer.int32(obj.k_volleyball, buffer, bufferOffset);
    // Serialize message field [k_basketball]
    bufferOffset = _serializer.float64(obj.k_basketball, buffer, bufferOffset);
    // Serialize message field [k_basket]
    bufferOffset = _serializer.int32(obj.k_basket, buffer, bufferOffset);
    // Serialize message field [k_mark]
    bufferOffset = _serializer.int32(obj.k_mark, buffer, bufferOffset);
    // Serialize message field [if_shot]
    bufferOffset = _serializer.bool(obj.if_shot, buffer, bufferOffset);
    // Serialize message field [if_show]
    bufferOffset = _serializer.bool(obj.if_show, buffer, bufferOffset);
    // Serialize message field [k_x0]
    bufferOffset = _serializer.float64(obj.k_x0, buffer, bufferOffset);
    // Serialize message field [k_y0]
    bufferOffset = _serializer.float64(obj.k_y0, buffer, bufferOffset);
    // Serialize message field [k_z0]
    bufferOffset = _serializer.float64(obj.k_z0, buffer, bufferOffset);
    // Serialize message field [k_x1]
    bufferOffset = _serializer.float64(obj.k_x1, buffer, bufferOffset);
    // Serialize message field [k_y1]
    bufferOffset = _serializer.float64(obj.k_y1, buffer, bufferOffset);
    // Serialize message field [k_z1]
    bufferOffset = _serializer.float64(obj.k_z1, buffer, bufferOffset);
    // Serialize message field [k_test]
    bufferOffset = _serializer.float64(obj.k_test, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type param
    let len;
    let data = new param(null);
    // Deserialize message field [NMS_THRESH]
    data.NMS_THRESH = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [CONF_THRESH]
    data.CONF_THRESH = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [k_volleyball]
    data.k_volleyball = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [k_basketball]
    data.k_basketball = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_basket]
    data.k_basket = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [k_mark]
    data.k_mark = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [if_shot]
    data.if_shot = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [if_show]
    data.if_show = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [k_x0]
    data.k_x0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_y0]
    data.k_y0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_z0]
    data.k_z0 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_x1]
    data.k_x1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_y1]
    data.k_y1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_z1]
    data.k_z1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [k_test]
    data.k_test = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 86;
  }

  static datatype() {
    // Returns string type for a message object
    return 'config/param';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb5de5e5d2fd7f2c45fa5a927466753a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 NMS_THRESH
    float32 CONF_THRESH
    int32 k_volleyball
    float64 k_basketball
    int32 k_basket
    int32 k_mark
    bool if_shot
    bool if_show
    float64 k_x0
    float64 k_y0
    float64 k_z0
    float64 k_x1
    float64 k_y1
    float64 k_z1
    float64 k_test
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new param(null);
    if (msg.NMS_THRESH !== undefined) {
      resolved.NMS_THRESH = msg.NMS_THRESH;
    }
    else {
      resolved.NMS_THRESH = 0.0
    }

    if (msg.CONF_THRESH !== undefined) {
      resolved.CONF_THRESH = msg.CONF_THRESH;
    }
    else {
      resolved.CONF_THRESH = 0.0
    }

    if (msg.k_volleyball !== undefined) {
      resolved.k_volleyball = msg.k_volleyball;
    }
    else {
      resolved.k_volleyball = 0
    }

    if (msg.k_basketball !== undefined) {
      resolved.k_basketball = msg.k_basketball;
    }
    else {
      resolved.k_basketball = 0.0
    }

    if (msg.k_basket !== undefined) {
      resolved.k_basket = msg.k_basket;
    }
    else {
      resolved.k_basket = 0
    }

    if (msg.k_mark !== undefined) {
      resolved.k_mark = msg.k_mark;
    }
    else {
      resolved.k_mark = 0
    }

    if (msg.if_shot !== undefined) {
      resolved.if_shot = msg.if_shot;
    }
    else {
      resolved.if_shot = false
    }

    if (msg.if_show !== undefined) {
      resolved.if_show = msg.if_show;
    }
    else {
      resolved.if_show = false
    }

    if (msg.k_x0 !== undefined) {
      resolved.k_x0 = msg.k_x0;
    }
    else {
      resolved.k_x0 = 0.0
    }

    if (msg.k_y0 !== undefined) {
      resolved.k_y0 = msg.k_y0;
    }
    else {
      resolved.k_y0 = 0.0
    }

    if (msg.k_z0 !== undefined) {
      resolved.k_z0 = msg.k_z0;
    }
    else {
      resolved.k_z0 = 0.0
    }

    if (msg.k_x1 !== undefined) {
      resolved.k_x1 = msg.k_x1;
    }
    else {
      resolved.k_x1 = 0.0
    }

    if (msg.k_y1 !== undefined) {
      resolved.k_y1 = msg.k_y1;
    }
    else {
      resolved.k_y1 = 0.0
    }

    if (msg.k_z1 !== undefined) {
      resolved.k_z1 = msg.k_z1;
    }
    else {
      resolved.k_z1 = 0.0
    }

    if (msg.k_test !== undefined) {
      resolved.k_test = msg.k_test;
    }
    else {
      resolved.k_test = 0.0
    }

    return resolved;
    }
};

module.exports = param;
