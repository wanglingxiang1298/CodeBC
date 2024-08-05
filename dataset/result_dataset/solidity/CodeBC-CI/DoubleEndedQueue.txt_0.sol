pragma solidity ^0.8.20;
library DoubleEndedQueue {
    bytes32[] _data;
    uint256 _start;
    uint256 _end;
    uint256 _length;
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds();
    constructor() {
        _start = 0;
        _end = 0;
        _length = 0;
    }
    function pushBack(bytes32 value) public {
        uint256 index = _length;
        if (index >= CAPACITY) {
            QueueFull();
        }
        _data[index] = value;
        _length++;
    }
    function popBack() public returns (bytes32 value) {
        if (_length == 0) {
            QueueEmpty();
        }
        value = _data[--_length];
        _data[index] = bytes32(0);
    }
    function pushFront(bytes32 value) public {
        uint256 index = _start;
        if (index == 0) {
            QueueFull();
        }
        _start--;
        _data[index] = value;
        _length++;
    }
    function popFront() public returns (bytes32 value) {
        if (_length == 0) {
            QueueEmpty();
        }
        value = _data[_start];
        _start++;
        _data[index] = bytes32(0);
    }
    function front() public view returns (bytes32 value) {
        if (_length > 0) {
            return _data[_start];
        } else {
            QueueEmpty();
        }
    }
    function back() public view returns (bytes32 value) {
        if (_length > 0) {
            return _data[_end];
        } else {
            QueueEmpty();
        }
    }
    function at(uint256 index) public view returns (bytes32 value) {
        if (index >= _length) {
            QueueOutOfBounds();
        }
        return _data[(_start + index) % CAPACITY];
    }
    function clear() public {
        _start = 0;
        _end = 0;
        _length = 0;
    }
    function length() public view returns (uint256) {
        return _length;
    }
    function empty() public view returns (bool) {
        return _length == 0;
    }
}