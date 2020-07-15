// Auto-generated. Do not edit!

// (in-package vaja01.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class string_ID {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.content = null;
      this.seqID = null;
    }
    else {
      if (initObj.hasOwnProperty('content')) {
        this.content = initObj.content
      }
      else {
        this.content = '';
      }
      if (initObj.hasOwnProperty('seqID')) {
        this.seqID = initObj.seqID
      }
      else {
        this.seqID = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type string_ID
    // Serialize message field [content]
    bufferOffset = _serializer.string(obj.content, buffer, bufferOffset);
    // Serialize message field [seqID]
    bufferOffset = _serializer.int32(obj.seqID, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type string_ID
    let len;
    let data = new string_ID(null);
    // Deserialize message field [content]
    data.content = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [seqID]
    data.seqID = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.content.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vaja01/string_ID';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b57dc76242a9a2500d39577844d88d65';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string content
    int32 seqID
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new string_ID(null);
    if (msg.content !== undefined) {
      resolved.content = msg.content;
    }
    else {
      resolved.content = ''
    }

    if (msg.seqID !== undefined) {
      resolved.seqID = msg.seqID;
    }
    else {
      resolved.seqID = 0
    }

    return resolved;
    }
};

module.exports = string_ID;
