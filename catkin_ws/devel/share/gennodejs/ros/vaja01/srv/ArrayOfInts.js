// Auto-generated. Do not edit!

// (in-package vaja01.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class ArrayOfIntsRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vrsta = null;
    }
    else {
      if (initObj.hasOwnProperty('vrsta')) {
        this.vrsta = initObj.vrsta
      }
      else {
        this.vrsta = new Array(10).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArrayOfIntsRequest
    // Check that the constant length array field [vrsta] has the right length
    if (obj.vrsta.length !== 10) {
      throw new Error('Unable to serialize array field vrsta - length must be 10')
    }
    // Serialize message field [vrsta]
    bufferOffset = _arraySerializer.int64(obj.vrsta, buffer, bufferOffset, 10);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArrayOfIntsRequest
    let len;
    let data = new ArrayOfIntsRequest(null);
    // Deserialize message field [vrsta]
    data.vrsta = _arrayDeserializer.int64(buffer, bufferOffset, 10)
    return data;
  }

  static getMessageSize(object) {
    return 80;
  }

  static datatype() {
    // Returns string type for a service object
    return 'vaja01/ArrayOfIntsRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b27f4ee2f5f9a6fe51b04f51349bc9d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64[10] vrsta
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArrayOfIntsRequest(null);
    if (msg.vrsta !== undefined) {
      resolved.vrsta = msg.vrsta;
    }
    else {
      resolved.vrsta = new Array(10).fill(0)
    }

    return resolved;
    }
};

class ArrayOfIntsResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.vsota = null;
    }
    else {
      if (initObj.hasOwnProperty('vsota')) {
        this.vsota = initObj.vsota
      }
      else {
        this.vsota = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ArrayOfIntsResponse
    // Serialize message field [vsota]
    bufferOffset = _serializer.int64(obj.vsota, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ArrayOfIntsResponse
    let len;
    let data = new ArrayOfIntsResponse(null);
    // Deserialize message field [vsota]
    data.vsota = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'vaja01/ArrayOfIntsResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f4d569a3f1f3567641c947c9808321aa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 vsota
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ArrayOfIntsResponse(null);
    if (msg.vsota !== undefined) {
      resolved.vsota = msg.vsota;
    }
    else {
      resolved.vsota = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: ArrayOfIntsRequest,
  Response: ArrayOfIntsResponse,
  md5sum() { return '9f68a5f63056c0474865224eaf043dcb'; },
  datatype() { return 'vaja01/ArrayOfInts'; }
};
