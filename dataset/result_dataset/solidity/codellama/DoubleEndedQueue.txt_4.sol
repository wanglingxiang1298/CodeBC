pragma solidity ^0.8.20;

import "DoubleEndedQueue.sol";

contract Deque {
    using DoubleEndedQueue for bytes32;

    bytes32[] _queue;

    constructor() public {
        _queue = new bytes32[](0);
    }

    function pushBack(bytes32 value) public {
        _queue.pushBack(value);
    }

    function popBack() public returns (bytes32) {
        require(_queue.length > 0, "QueueEmpty");
        return _queue.popBack();
    }

    function pushFront(bytes32 value) public {
        _queue.pushFront(value);
    }

    function popFront() public returns (bytes32) {
        require(_queue.length > 0, "QueueEmpty");
        return _queue.popFront();
    }

    function front() public view returns (bytes32) {
        require(_queue.length > 0, "QueueEmpty");
        return _queue.front();
    }

    function back() public view returns (bytes32) {
        require(_queue.length > 0, "QueueEmpty");
        return _queue.back();
    }

    function at(uint256 index) public view returns (bytes32) {
        require(index < _queue.length, "QueueOutOfBounds");
        return _queue.at(index);
    }

    function clear() public {
        _queue.clear();
    }

    function length() public view returns (uint256) {
        return _queue.length;
    }

    function empty() public view returns (bool) {
        return _queue.length == 0;
    }
}