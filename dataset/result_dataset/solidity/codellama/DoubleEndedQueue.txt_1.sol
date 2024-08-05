pragma solidity ^0.8.20;

import "DoubleEndedQueue.sol";

contract Deque {
    using DoubleEndedQueue for bytes32;

    bytes32[] private _queue;
    uint256 private _startIndex;
    uint256 private _endIndex;

    constructor() {
        _queue = new bytes32[](10);
        _startIndex = 0;
        _endIndex = 0;
    }

    function pushBack(bytes32 value) public {
        require(!_queue.isFull(), "QueueFull");
        _queue.pushBack(value);
        _endIndex++;
    }

    function popBack() public {
        require(!_queue.isEmpty(), "QueueEmpty");
        _queue.popBack();
        _endIndex--;
    }

    function pushFront(bytes32 value) public {
        require(!_queue.isFull(), "QueueFull");
        _queue.pushFront(value);
        _startIndex++;
    }

    function popFront() public {
        require(!_queue.isEmpty(), "QueueEmpty");
        _queue.popFront();
        _startIndex--;
    }

    function front() public view returns (bytes32) {
        require(!_queue.isEmpty(), "QueueEmpty");
        return _queue.front();
    }

    function back() public view returns (bytes32) {
        require(!_queue.isEmpty(), "QueueEmpty");
        return _queue.back();
    }

    function at(uint256 index) public view returns (bytes32) {
        require(index >= 0 && index < _queue.length, "QueueOutOfBounds");
        return _queue[index];
    }

    function clear() public {
        _queue.clear();
        _startIndex = 0;
        _endIndex = 0;
    }

    function length() public view returns (uint256) {
        return _queue.length;
    }

    function empty() public view returns (bool) {
        return _queue.isEmpty();
    }
}