// Auto-generated. Do not edit!

// (in-package vaja02.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MovementRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.move_shape = null;
      this.duration = null;
    }
    else {
      if (initObj.hasOwnProperty('move_shape')) {
        this.move_shape = initObj.move_shape
      }
      else {
        this.move_shape = '';
      }
      if (initObj.hasOwnProperty('duration')) {
        this.duration = initObj.duration
      }
      else {
        this.duration = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementRequest
    // Serialize message field [move_shape]
    bufferOffset = _serializer.string(obj.move_shape, buffer, bufferOffset);
    // Serialize message field [duration]
    bufferOffset = _serializer.int64(obj.duration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementRequest
    let len;
    let data = new MovementRequest(null);
    // Deserialize message field [move_shape]
    data.move_shape = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [duration]
    data.duration = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.move_shape.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a service object
    return 'vaja02/MovementRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'efed902aaa4c34dda361975de64b143e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string move_shape
    int64 duration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementRequest(null);
    if (msg.move_shape !== undefined) {
      resolved.move_shape = msg.move_shape;
    }
    else {
      resolved.move_shape = ''
    }

    if (msg.duration !== undefined) {
      resolved.duration = msg.duration;
    }
    else {
      resolved.duration = 0
    }

    return resolved;
    }
};

class MovementResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.shape = null;
    }
    else {
      if (initObj.hasOwnProperty('shape')) {
        this.shape = initObj.shape
      }
      else {
        this.shape = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementResponse
    // Serialize message field [shape]
    bufferOffset = _serializer.string(obj.shape, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementResponse
    let len;
    let data = new MovementResponse(null);
    // Deserialize message field [shape]
    data.shape = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.shape.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'vaja02/MovementResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fa50c30980f0f012451f487eb6d76d53';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string shape
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementResponse(null);
    if (msg.shape !== undefined) {
      resolved.shape = msg.shape;
    }
    else {
      resolved.shape = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: MovementRequest,
  Response: MovementResponse,
  md5sum() { return '03ddf760f94194b459db8b360beaa75c'; },
  datatype() { return 'vaja02/Movement'; }
};
