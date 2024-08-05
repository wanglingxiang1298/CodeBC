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
        if (deque._values.length == 0 || index >= deque._values.length) {
            revert QueueOutOfBounds(index);
        }
        return deque._values[index];
    }
    function _pushBack(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == 0) {
            deque._values.push(value);
            deque._start = 0;
            deque._end = 1;
        } else if (deque._end == deque._values.length) {
            deque._values.push(value);
            deque._end++;
        } else {
            uint256 index = (deque._end + deque._values.length) % deque._values.length;
            deque._values[index] = value;
            deque._end = (deque._end + 1) % deque._values.length;
        }
    }
    function _popBack(Deque storage deque) internal returns (bytes32) {
        if (deque._values.length == 0) {
            revert QueueEmpty();
        }
        uint256 index = (deque._start + deque._values.length - 1) % deque._values.length;
        bytes32 value = deque._values[index];
        deque._start = (deque._start + 1) % deque._values.length;
        if (deque._start == deque._end) {
            deque._start = 0;
            deque._end = 0;
        }
        return value;
    }
    function _pushFront(Deque storage deque, bytes32 value) internal {
        if (deque._values.length == 0) {
            deque._values.push(value);
            deque._start = 0;
            deque._end = 1;
        } else if (deque._start == 0) {
            deque._start = deque._values.length - 1;
            deque._values.push(value);
        } else {
            deque._start--;
            uint256 index = deque._start;
            deque._values[index] = value;
        }
    }
    function _popFront(Deque storage deque) internal returns (bytes32) {
        if (deque._values.length == 0) {
            revert QueueEmpty();
        }
        uint256 index = deque._start;
        bytes32 value = deque._values[index];
        deque._start = (deque._start + 1) % deque._values.length;
        if (deque._start == deque._end) {
            deque._start = 0;
            deque._end = 0;
        }
        return value;
    }
    function pushBack(Deque storage deque, bytes32 value) internal {
        _pushBack(deque, value);
    }
    function popBack(Deque storage deque) internal returns (bytes32) {
        return _popBack(deque);
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        _pushFront(deque, value);
    }
    function popFront(Deque storage deque) internal returns (bytes32) {
        return _popFront(deque);
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque._start);
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque._end == 0? deque._end + deque._values.length : deque._end - 1);
    }
    function at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        return _at(deque, index);
    }
    function clear(Deque storage deque) internal {
        deque._values.length = 0;
        deque._start = 0;
        deque._end = 0;
    }
    function length(Deque storage deque) internal view returns (uint256) {
        if (deque._values.length == 0) {
            return 0;
        } else if (deque._start <= deque._end) {
            return deque._end - deque._start;
        } else {
            return deque._end - deque._start + deque._values.length;
        }
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return deque._values.length == 0 || deque._start == deque._end;
    }
}

