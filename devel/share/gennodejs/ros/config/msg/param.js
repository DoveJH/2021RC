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
        this.k_basketball = 0;
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
    bufferOffset = _serializer.int32(obj.k_basketball, buffer, bufferOffset);
    // Serialize message field [k_basket]
    bufferOffset = _serializer.int32(obj.k_basket, buffer, bufferOffset);
    // Serialize message field [k_mark]
    bufferOffset = _serializer.int32(obj.k_mark, buffer, bufferOffset);
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
    data.k_basketball = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [k_basket]
    data.k_basket = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [k_mark]
    data.k_mark = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'config/param';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9364dee32f19eb394cddb06cd910fe87';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 NMS_THRESH
    float32 CONF_THRESH
    int32 k_volleyball
    int32 k_basketball
    int32 k_basket
    int32 k_mark
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
      resolved.k_basketball = 0
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

    return resolved;
    }
};

module.exports = param;
