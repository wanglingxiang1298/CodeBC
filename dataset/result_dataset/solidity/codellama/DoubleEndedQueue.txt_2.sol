pragma solidity ^0.8.20;

import "DoubleEndedQueue.sol";

contract Deque {
    using DoubleEndedQueue for bytes32;

    bytes32[] private _queue;
    uint256 private _start;
    uint256 private _end;

    constructor() public {
        _queue = new bytes32[](0);
        _start = 0;
        _end = 0;
    }

    function pushBack(bytes32 value) public {
        require(!_queue.full(), "QueueFull");
        _queue.push(value);
        _end++;
    }

    function popBack() public {
        require(!_queue.empty(), "QueueEmpty");
        bytes32 value = _queue[_end];
        _queue.pop();
        _end--;
        return value;
    }

    function pushFront(bytes32 value) public {
        require(!_queue.full(), "QueueFull");
        _queue.push(value);
        _start++;
    }

    function popFront() public {
        require(!_queue.empty(), "QueueEmpty");
        bytes32 value = _queue[_start];
        _queue.pop();
        _start--;
        return value;
    }

    function front() public view returns (bytes32) {
        require(!_queue.empty(), "QueueEmpty");
        return _queue[_start];
    }

    function back() public view returns (bytes32) {
        require(!_queue.empty(), "QueueEmpty");
        return _queue[_end];
    }

    function at(uint256 index) public view returns (bytes32) {
        require(index < _queue.length, "QueueOutOfBounds");
        return _queue[index];
    }

    function clear() public {
        _queue.clear();
        _start = 0;
        _end = 0;
    }

    function length() public view returns (uint256) {
        return _queue.length;
    }

    function empty() public view returns (bool) {
        return _queue.empty();
    }
}