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
        if (deque._start > deque._end) {
            if (index >= deque._start || index < length + deque._start) {
                return deque._values[length + index - deque._start];
            } else {
                revert QueueOutOfBounds(index);
            }
        } else {
            if (index >= deque._start && index < deque._end) {
                return deque._values[index - deque._start];
            } else {
                revert QueueOutOfBounds(index);
            }
        }
    }
    function pushBack(Deque storage deque, bytes32 value) internal {
        uint256 length = deque._values.length;
        if (deque._start > deque._end) {
            deque._values.push(value);
        } else {
            if (deque._end == length) {
                deque._values.push(value);
            } else {
                deque._values[deque._end] = value;
            }
        }
        deque._end = (deque._end + 1) % length;
    }
    function popBack(Deque storage deque) internal returns (bytes32) {
        if (deque._start == deque._end) {
            revert QueueEmpty();
        }
        uint256 length = deque._values.length;
        bytes32 value = deque._values[deque._end];
        deque._end = (deque._end + 1) % length;
        return value;
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        uint256 length = deque._values.length;
        deque._start = (deque._start + length - 1) % length;
        deque._values.push(value);
        deque._start = (deque._start + 1) % length;
    }
    function popFront(Deque storage deque) internal returns (bytes32) {
        if (deque._start == deque._end) {
            revert QueueEmpty();
        }
        uint256 length = deque._values.length;
        deque._start = (deque._start + 1) % length;
        bytes32 value = deque._values[deque._start];
        deque._start = (deque._start + length - 1) % length;
        return value;
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        if (deque._start == deque._end) {
            revert QueueEmpty();
        }
        return _at(deque, deque._start);
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque._end);
    }
    function at(Deque storage deque, uint256 index) internal view returns (bytes32) {
        return _at(deque, index);
    }
    function clear(Deque storage deque) internal {
        deque._start = 0;
        deque._end = 0;
    }
    function length(Deque storage deque) internal view returns (uint256) {
        if (deque._start > deque._end) {
            return deque._values.length - (deque._end - deque._start);
        } else {
            return deque._end - deque._start;
        }
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return deque._start == deque._end;
    }
}

