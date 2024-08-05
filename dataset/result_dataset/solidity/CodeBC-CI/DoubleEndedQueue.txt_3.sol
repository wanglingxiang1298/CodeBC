pragma solidity ^0.8.20;
library DoubleEndedQueue {
    bytes32[] _queue;
    uint256 _start;
    uint256 _end;
    uint256 _length;
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds();
    constructor() {
        _queue = new bytes32[](10);
        _start = 0;
        _end = 0;
        _length = 0;
    }
    function pushBack(bytes32 value) public {
        uint256 index = (_end + _length) % _queue.length;
        require(index!= _start, "QueueFull");
        _queue[index] = value;
        _end = index;
        _length++;
    }
    function popBack() public returns (bytes32 value) {
        require(!empty(), "QueueEmpty");
        value = _queue[_end];
        _end = (_end + 1) % _queue.length;
        _length--;
    }
    function pushFront(bytes32 value) public {
        uint256 index = _start;
        require(index!= (_end + _length) % _queue.length, "QueueFull");
        _queue[index] = value;
        _start = index;
        _length++;
    }
    function popFront() public returns (bytes32 value) {
        require(!empty(), "QueueEmpty");
        value = _queue[_start];
        _start = (_start + 1) % _queue.length;
        _length--;
    }
    function front() public view returns (bytes32 value) {
        require(!empty(), "QueueEmpty");
        value = _queue[_start];
    }
    function back() public view returns (bytes32 value) {
        require(!empty(), "QueueEmpty");
        value = _queue[_end];
    }
    function at(uint256 index) public view returns (bytes32 value) {
        require(index < _length, "QueueOutOfBounds");
        value = _queue[(_start + index) % _queue.length];
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