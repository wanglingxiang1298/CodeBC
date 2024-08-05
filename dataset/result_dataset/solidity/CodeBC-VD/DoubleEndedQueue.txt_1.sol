pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Deque {
        bytes32[] _values;
        uint256 _start;
        uint256 _end;
    }
    uint256 internal constant _MAX_CAPACITY = type(uint256).max;
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds(uint256 index);
    function _at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        uint256 length = deque._values.length;
        if (index >= length) {
            revert QueueOutOfBounds(index);
        }
        uint256 arrayIndex = (deque._start + index) % length;
        return deque._values[arrayIndex];
    }
    function _pushBack(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == deque._end) {
            revert QueueFull();
        }
        deque._values[deque._end] = value;
        deque._end = (deque._end + 1) % deque._values.length;
    }
    function _pushFront(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == deque._start) {
            revert QueueFull();
        }
        deque._start = (deque._start - 1) % deque._values.length;
        deque._values[deque._start] = value;
    }
    function _popBack(Deque storage deque) internal returns (bytes32) {
        if (deque._values.length == 0) {
            revert QueueEmpty();
        }
        uint256 end = deque._end;
        bytes32 value = deque._values[end];
        deque._end = (end + 1) % deque._values.length;
        return value;
    }
    function _popFront(Deque storage deque) internal returns (bytes32) {
        if (deque._values.length == 0) {
            revert QueueEmpty();
        }
        uint256 start = deque._start;
        bytes32 value = deque._values[start];
        deque._start = (start + 1) % deque._values.length;
        return value;
    }
    function pushBack(Deque storage deque, bytes32 value) internal {
        _pushBack(deque, value);
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        _pushFront(deque, value);
    }
    function popBack(Deque storage deque) internal returns (bytes32) {
        return _popBack(deque);
    }
    function popFront(Deque storage deque) internal returns (bytes32) {
        return _popFront(deque);
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, 0);
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque.length - 1);
    }
    function clear(Deque storage deque) internal {
        deque._start = deque._end;
        deque._values.length = 0;
    }
    function length(Deque storage deque) internal view returns (uint256) {
        return deque._values.length > deque._start? deque._values.length - deque._start : 0;
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return deque._values.length == 0;
    }
}