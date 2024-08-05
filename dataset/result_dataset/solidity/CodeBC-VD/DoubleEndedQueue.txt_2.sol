pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        bytes32[] _values;
        uint256 _start;
        uint256 _end;
    }
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds(uint256 value);
    function _at(Queue storage queue, uint256 index)
        internal
        view
        returns (bytes32)
    {
        uint256 length = queue._values.length;
        if (index >= length) {
            revert QueueOutOfBounds(index);
        }
        uint256 arrayIndex = (queue._start + index) % length;
        return queue._values[arrayIndex];
    }
    function pushBack(Queue storage queue, bytes32 value) internal {
        if (queue._values.length == queue._end) {
            revert QueueFull();
        }
        queue._values[queue._end] = value;
        queue._end = (queue._end + 1) % queue._values.length;
    }
    function popBack(Queue storage queue) internal {
        if (queue._values.length == 0) {
            revert QueueEmpty();
        }
        queue._end = (queue._end + queue._values.length - 1) %
            queue._values.length;
    }
    function pushFront(Queue storage queue, bytes32 value) internal {
        if (queue._values.length == queue._start) {
            revert QueueFull();
        }
        queue._start = (queue._start + queue._values.length - 1) %
            queue._values.length;
        queue._values[queue._start] = value;
    }
    function popFront(Queue storage queue) internal {
        if (queue._values.length == 0) {
            revert QueueEmpty();
        }
        queue._start = (queue._start + 1) % queue._values.length;
    }
    function front(Queue storage queue) internal view returns (bytes32) {
        if (queue._values.length == 0) {
            return bytes32(0);
        }
        return _at(queue, 0);
    }
    function back(Queue storage queue) internal view returns (bytes32) {
        if (queue._values.length == 0) {
            return bytes32(0);
        }
        return _at(queue, queue._values.length - 1);
    }
    function at(Queue storage queue, uint256 index)
        internal
        view
        returns (bytes32)
    {
        return _at(queue, index);
    }
    function clear(Queue storage queue) internal {
        delete queue._values;
        queue._start = 0;
        queue._end = 0;
    }
    function length(Queue storage queue) internal view returns (uint256) {
        return (queue._values.length + queue._values.length - 1 - queue._start + queue._end) %
            queue._values.length;
    }
    function empty(Queue storage queue) internal view returns (bool) {
        return length(queue) == 0;
    }
}