// Auto-generated. Do not edit!

// (in-package costmap_layers.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let geometry_msgs = _finder('geometry_msgs');

//-----------------------------------------------------------

class Wall {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.identifier = null;
      this.from = null;
      this.to = null;
      this.width = null;
    }
    else {
      if (initObj.hasOwnProperty('identifier')) {
        this.identifier = initObj.identifier
      }
      else {
        this.identifier = '';
      }
      if (initObj.hasOwnProperty('from')) {
        this.from = initObj.from
      }
      else {
        this.from = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('to')) {
        this.to = initObj.to
      }
      else {
        this.to = new geometry_msgs.msg.Point();
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Wall
    // Serialize message field [identifier]
    bufferOffset = _serializer.string(obj.identifier, buffer, bufferOffset);
    // Serialize message field [from]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.from, buffer, bufferOffset);
    // Serialize message field [to]
    bufferOffset = geometry_msgs.msg.Point.serialize(obj.to, buffer, bufferOffset);
    // Serialize message field [width]
    bufferOffset = _serializer.int32(obj.width, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Wall
    let len;
    let data = new Wall(null);
    // Deserialize message field [identifier]
    data.identifier = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [from]
    data.from = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [to]
    data.to = geometry_msgs.msg.Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [width]
    data.width = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.identifier.length;
    return length + 56;
  }

  static datatype() {
    // Returns string type for a message object
    return 'costmap_layers/Wall';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '68c0f9e0fd6bb3eb2070700be3dd1d6a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string identifier
    geometry_msgs/Point from
    geometry_msgs/Point to
    int32 width
    
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Wall(null);
    if (msg.identifier !== undefined) {
      resolved.identifier = msg.identifier;
    }
    else {
      resolved.identifier = ''
    }

    if (msg.from !== undefined) {
      resolved.from = geometry_msgs.msg.Point.Resolve(msg.from)
    }
    else {
      resolved.from = new geometry_msgs.msg.Point()
    }

    if (msg.to !== undefined) {
      resolved.to = geometry_msgs.msg.Point.Resolve(msg.to)
    }
    else {
      resolved.to = new geometry_msgs.msg.Point()
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    return resolved;
    }
};

module.exports = Wall;
