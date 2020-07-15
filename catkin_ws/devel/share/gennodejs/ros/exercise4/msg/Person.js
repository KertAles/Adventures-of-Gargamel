// Auto-generated. Do not edit!

// (in-package exercise4.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Person {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.app_x = null;
      this.app_y = null;
      this.app_z = null;
      this.hair_col = null;
      this.hair_len = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
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
      if (initObj.hasOwnProperty('hair_col')) {
        this.hair_col = initObj.hair_col
      }
      else {
        this.hair_col = '';
      }
      if (initObj.hasOwnProperty('hair_len')) {
        this.hair_len = initObj.hair_len
      }
      else {
        this.hair_len = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Person
    // Serialize message field [id]
    bufferOffset = _serializer.int64(obj.id, buffer, bufferOffset);
    // Serialize message field [app_x]
    bufferOffset = _serializer.float64(obj.app_x, buffer, bufferOffset);
    // Serialize message field [app_y]
    bufferOffset = _serializer.float64(obj.app_y, buffer, bufferOffset);
    // Serialize message field [app_z]
    bufferOffset = _serializer.float64(obj.app_z, buffer, bufferOffset);
    // Serialize message field [hair_col]
    bufferOffset = _serializer.string(obj.hair_col, buffer, bufferOffset);
    // Serialize message field [hair_len]
    bufferOffset = _serializer.string(obj.hair_len, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Person
    let len;
    let data = new Person(null);
    // Deserialize message field [id]
    data.id = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [app_x]
    data.app_x = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [app_y]
    data.app_y = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [app_z]
    data.app_z = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [hair_col]
    data.hair_col = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [hair_len]
    data.hair_len = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.hair_col.length;
    length += object.hair_len.length;
    return length + 40;
  }

  static datatype() {
    // Returns string type for a message object
    return 'exercise4/Person';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '7cad3912a48d80acec18d17fde7286bc';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 id
    float64 app_x
    float64 app_y
    float64 app_z
    string hair_col
    string hair_len
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Person(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
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

    if (msg.hair_col !== undefined) {
      resolved.hair_col = msg.hair_col;
    }
    else {
      resolved.hair_col = ''
    }

    if (msg.hair_len !== undefined) {
      resolved.hair_len = msg.hair_len;
    }
    else {
      resolved.hair_len = ''
    }

    return resolved;
    }
};

module.exports = Person;
