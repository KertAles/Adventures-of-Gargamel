// Auto-generated. Do not edit!

// (in-package exercise6.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Ring {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.color = null;
      this.app_x = null;
      this.app_y = null;
      this.app_z = null;
    }
    else {
      if (initObj.hasOwnProperty('color')) {
        this.color = initObj.color
      }
      else {
        this.color = '';
      }
      if (initObj.hasOwnProperty('app_x')) {
        this.app_x = initObj.app_x
      }
      else {
        this.app_x = 0.0;
      }
      if (initObj.hasOwnProperty('app_y')) {
        this.app_y = initObj.app_y
      }
      else {
        this.app_y = 0.0;
      }
      if (initObj.hasOwnProperty('app_z')) {
        this.app_z = initObj.app_z
      }
      else {
        this.app_z = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Ring
    // Serialize message field [color]
    bufferOffset = _serializer.string(obj.color, buffer, bufferOffset);
    // Serialize message field [app_x]
    bufferOffset = _serializer.float64(obj.app_x, buffer, bufferOffset);
    // Serialize message field [app_y]
    bufferOffset = _serializer.float64(obj.app_y, buffer, bufferOffset);
    // Serialize message field [app_z]
    bufferOffset = _serializer.float64(obj.app_z, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Ring
    let len;
    let data = new Ring(null);
    // Deserialize message field [color]
    data.color = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [app_x]
    data.app_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [app_y]
    data.app_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [app_z]
    data.app_z = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.color.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a message object
    return 'exercise6/Ring';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '63915ba74a2bfae4d77cf9f3f4b83726';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string color
    float64 app_x
    float64 app_y
    float64 app_z
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Ring(null);
    if (msg.color !== undefined) {
      resolved.color = msg.color;
    }
    else {
      resolved.color = ''
    }

    if (msg.app_x !== undefined) {
      resolved.app_x = msg.app_x;
    }
    else {
      resolved.app_x = 0.0
    }

    if (msg.app_y !== undefined) {
      resolved.app_y = msg.app_y;
    }
    else {
      resolved.app_y = 0.0
    }

    if (msg.app_z !== undefined) {
      resolved.app_z = msg.app_z;
    }
    else {
      resolved.app_z = 0.0
    }

    return resolved;
    }
};

module.exports = Ring;
