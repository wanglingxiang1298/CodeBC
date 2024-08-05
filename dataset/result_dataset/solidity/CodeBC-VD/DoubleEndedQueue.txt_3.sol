pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Deque {
        bytes32[] _values;
        uint256 _start;
        uint256 _end;
    }
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds(uint256 index);
    function _at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        if (index >= deque._values.length) {
            revert QueueOutOfBounds(index);
        }
        return deque._values[index];
    }
    function pushBack(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == deque._end) {
            revert QueueFull();
        }
        deque._values[deque._end] = value;
        deque._end = deque._end + 1;
    }
    function popBack(Deque storage deque) internal {
        if (deque._start == deque._end) {
            revert QueueEmpty();
        }
        deque._end = deque._end - 1;
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == deque._start) {
            revert QueueFull();
        }
        deque._start = deque._start - 1;
        deque._values[deque._start] = value;
    }
    function popFront(Deque storage deque) internal {
        if (deque._start == deque._end) {
            revert QueueEmpty();
        }
        deque._start = deque._start + 1;
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        if (deque._start == deque._end) {
            return bytes32(0);
        }
        return _at(deque, deque._start);
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        if (deque._start == deque._end) {
            return bytes32(0);
        }
        return _at(deque, deque._end - 1);
    }
    function at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        if (index >= deque._values.length) {
            return bytes32(0);
        }
        return _at(deque, index);
    }
    function clear(Deque storage deque) internal {
        deque._start = deque._end = 0;
        deque._values.length = 0;
    }
    function length(Deque storage deque) internal view returns (uint256) {
        return deque._values.length - (deque._start + deque._end);
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return deque._start == deque._end;
    }
}