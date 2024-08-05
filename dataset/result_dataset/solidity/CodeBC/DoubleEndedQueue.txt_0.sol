pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Deque {
        bytes32[] _values;
        uint256 _start;
        uint256 _end;
    }
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds(uint256 value);
    function _at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        uint256 length = deque._values.length;
        if (deque._values.length == 0) {
            return bytes32(0);
        }
        if (index >= length) {
            revert QueueOutOfBounds(index);
        }
        uint256 arrayIndex = (deque._start + index) % length;
        return deque._values[arrayIndex];
    }
    function pushBack(Deque storage deque, bytes32 value) internal {
        uint256 length = deque._values.length;
        if (deque._values.length == 0) {
            deque._values.push(value);
            deque._start = 0;
            deque._end = 0;
            return;
        }
        if (deque._values.length == deque._values.length) {
            revert QueueFull();
        }
        deque._values.push(value);
        deque._end = (deque._end + 1) % length;
    }
    function popBack(Deque storage deque) internal returns (bytes32) {
        uint256 length = deque._values.length;
        if (length == 0) {
            revert QueueEmpty();
        }
        uint256 index = deque._end;
        bytes32 value = deque._values[index];
        deque._end = (deque._end + length - 1) % length;
        deque._values.pop();
        return value;
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        uint256 length = deque._values.length;
        if (deque._values.length == 0) {
            deque._values.push(value);
            deque._start = 0;
            deque._end = 0;
            return;
        }
        if (deque._values.length == deque._values.length) {
            revert QueueFull();
        }
        deque._values.push(value);
        deque._start = (deque._start + length - 1) % length;
    }
    function popFront(Deque storage deque) internal returns (bytes32) {
        uint256 length = deque._values.length;
        if (length == 0) {
            revert QueueEmpty();
        }
        uint256 index = deque._start;
        bytes32 value = deque._values[index];
        deque._start = (deque._start + 1) % length;
        deque._values.pop();
        return value;
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        uint256 length = deque._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        return deque._values[deque._start];
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        uint256 length = deque._values.length;
        if (length == 0) {
            return bytes32(0);
        }
        return deque._values[(deque._end + length - 1) % length];
    }
    function at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        uint256 length = deque._values.length;
        if (deque._values.length == 0) {
            return bytes32(0);
        }
        if (index >= length) {
            revert QueueOutOfBounds(index);
        }
        uint256 arrayIndex = (deque._start + index) % length;
        return deque._values[arrayIndex];
    }
    function clear(Deque storage deque) internal {
        deque._start = 0;
        deque._end = 0;
    }
    function length(Deque storage deque) internal view returns (uint256) {
        return deque._values.length - (deque._start > 0? deque._start : deque._values.length);
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return deque._values.length == 0;
    }
}
