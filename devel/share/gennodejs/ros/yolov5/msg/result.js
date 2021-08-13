// Auto-generated. Do not edit!

// (in-package yolov5.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class result {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.bbox0 = null;
      this.bbox1 = null;
      this.bbox2 = null;
      this.bbox3 = null;
      this.conf = null;
      this.class_id = null;
    }
    else {
      if (initObj.hasOwnProperty('bbox0')) {
        this.bbox0 = initObj.bbox0
      }
      else {
        this.bbox0 = 0.0;
      }
      if (initObj.hasOwnProperty('bbox1')) {
        this.bbox1 = initObj.bbox1
      }
      else {
        this.bbox1 = 0.0;
      }
      if (initObj.hasOwnProperty('bbox2')) {
        this.bbox2 = initObj.bbox2
      }
      else {
        this.bbox2 = 0.0;
      }
      if (initObj.hasOwnProperty('bbox3')) {
        this.bbox3 = initObj.bbox3
      }
      else {
        this.bbox3 = 0.0;
      }
      if (initObj.hasOwnProperty('conf')) {
        this.conf = initObj.conf
      }
      else {
        this.conf = 0.0;
      }
      if (initObj.hasOwnProperty('class_id')) {
        this.class_id = initObj.class_id
      }
      else {
        this.class_id = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type result
    // Serialize message field [bbox0]
    bufferOffset = _serializer.float32(obj.bbox0, buffer, bufferOffset);
    // Serialize message field [bbox1]
    bufferOffset = _serializer.float32(obj.bbox1, buffer, bufferOffset);
    // Serialize message field [bbox2]
    bufferOffset = _serializer.float32(obj.bbox2, buffer, bufferOffset);
    // Serialize message field [bbox3]
    bufferOffset = _serializer.float32(obj.bbox3, buffer, bufferOffset);
    // Serialize message field [conf]
    bufferOffset = _serializer.float32(obj.conf, buffer, bufferOffset);
    // Serialize message field [class_id]
    bufferOffset = _serializer.float32(obj.class_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type result
    let len;
    let data = new result(null);
    // Deserialize message field [bbox0]
    data.bbox0 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bbox1]
    data.bbox1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bbox2]
    data.bbox2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [bbox3]
    data.bbox3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [conf]
    data.conf = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [class_id]
    data.class_id = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'yolov5/result';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '043d72adf347ac3893fd75771296e418';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 bbox0
    float32 bbox1
    float32 bbox2
    float32 bbox3
    float32 conf
    float32 class_id
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new result(null);
    if (msg.bbox0 !== undefined) {
      resolved.bbox0 = msg.bbox0;
    }
    else {
      resolved.bbox0 = 0.0
    }

    if (msg.bbox1 !== undefined) {
      resolved.bbox1 = msg.bbox1;
    }
    else {
      resolved.bbox1 = 0.0
    }

    if (msg.bbox2 !== undefined) {
      resolved.bbox2 = msg.bbox2;
    }
    else {
      resolved.bbox2 = 0.0
    }

    if (msg.bbox3 !== undefined) {
      resolved.bbox3 = msg.bbox3;
    }
    else {
      resolved.bbox3 = 0.0
    }

    if (msg.conf !== undefined) {
      resolved.conf = msg.conf;
    }
    else {
      resolved.conf = 0.0
    }

    if (msg.class_id !== undefined) {
      resolved.class_id = msg.class_id;
    }
    else {
      resolved.class_id = 0.0
    }

    return resolved;
    }
};

module.exports = result;
