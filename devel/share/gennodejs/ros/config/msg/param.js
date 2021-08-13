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
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type param
    // Serialize message field [NMS_THRESH]
    bufferOffset = _serializer.float32(obj.NMS_THRESH, buffer, bufferOffset);
    // Serialize message field [CONF_THRESH]
    bufferOffset = _serializer.float32(obj.CONF_THRESH, buffer, bufferOffset);
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
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'config/param';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a0b1b6f3d3665bfdff09071fd56959d6';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 NMS_THRESH
    float32 CONF_THRESH
    
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

    return resolved;
    }
};

module.exports = param;
