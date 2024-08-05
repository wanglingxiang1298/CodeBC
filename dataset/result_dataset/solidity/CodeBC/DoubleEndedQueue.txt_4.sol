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
    function _at(Queue storage queue, uint256 index) internal view returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        uint256 start = queue._start;
        uint256 end = queue._end;
        if (start > end) {
            if (index >= (length + start)) {
                revert QueueOutOfBounds(index);
            }
            return queue._values[index + start - 1];
        } else {
            if (index >= length) {
                revert QueueOutOfBounds(index);
            }
            return queue._values[index + start];
        }
    }
    function pushBack(Queue storage queue, bytes32 value) internal {
        uint256 length = queue._values.length;
        if (queue._values.length == length) {
            if (queue._values.length == queue._values.capacity) {
                revert QueueFull();
            }
            queue._values.length++;
        }
        uint256 end = queue._end;
        queue._values[end] = value;
        if (end == uint256(-1)) {
            queue._start = 0;
        }
        queue._end = (end + 1) % length;
    }
    function pushFront(Queue storage queue, bytes32 value) internal {
        uint256 length = queue._values.length;
        if (queue._values.length == length) {
            if (queue._values.length == queue._values.capacity) {
                revert QueueFull();
            }
            queue._values.length++;
        }
        uint256 start = queue._start;
        queue._values[start] = value;
        if (start == uint256(-1)) {
            queue._end = length - 1;
        }
        queue._start = (start + 1) % length;
    }
    function popBack(Queue storage queue) internal returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            revert QueueEmpty();
        }
        uint256 end = queue._end;
        bytes32 value = queue._values[end];
        delete queue._values[end];
        queue._end = (end + length - 1) % length;
        return value;
    }
    function popFront(Queue storage queue) internal returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            revert QueueEmpty();
        }
        uint256 start = queue._start;
        bytes32 value = queue._values[start];
        delete queue._values[start];
        queue._start = (start + 1) % length;
        return value;
    }
    function back(Queue storage queue) internal view returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        uint256 end = queue._end;
        return _at(queue, end == uint256(-1)? length - 1 : end - 1);
    }
    function front(Queue storage queue) internal view returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        uint256 start = queue._start;
        return _at(queue, start == uint256(-1)? length - 1 : start);
    }
    function at(Queue storage queue, uint256 index) internal view returns (bytes32) {
        uint256 length = queue._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        return _at(queue, index);
    }
    function clear(Queue storage queue) internal {
        uint256 length = queue._values.length;
        if (length == 0) {
            return;
        }
        for (uint256 i = 0; i < length; i++) {
            delete queue._values[i];
        }
        queue._values.length = 0;
        queue._start = uint256(-1);
        queue._end = uint256(-1);
    }
    function length(Queue storage queue) internal view returns (uint256) {
        uint256 length = queue._values.length;
        if (queue._values.length == 0) {
            return 0;
        }
        if (queue._start > queue._end) {
            return length + queue._start - queue._end;
        } else {
            return queue._end - queue._start;
        }
    }
    function empty(Queue storage queue) internal view returns (bool) {
        uint256 length = queue._values.length;
        if (queue._values.length == 0) {
            return true;
        }
        return length == 0;
    }
}

