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
        uint256 _length = deque._values.length;
        if (deque._start > deque._end) {
            if (index >= deque._start || index < _length + deque._start) {
                return deque._values[index];
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
        uint256 _length = deque._values.length;
        if (deque._start > deque._end) {
            if (_length >= deque._start) {
                revert QueueFull();
            }
        } else {
            if (deque._values.length >= deque._end) {
                revert QueueFull();
            }
        }
        deque._values.push(value);
        deque._end++;
        if (deque._start > deque._end) {
            deque._start++;
        }
    }
    function pushFront(Deque storage deque, bytes32 value) internal {
        if (deque._start > deque._end) {
            deque._values.push(value);
            deque._start--;
        } else {
            deque._values.push(value);
        }
        deque._end++;
    }
    function popBack(Deque storage deque) internal returns (bytes32) {
        if (deque._start > deque._end) {
            if (deque._start == deque._end) {
                revert QueueEmpty();
            }
        } else {
            if (deque._end == deque._start) {
                revert QueueEmpty();
            }
        }
        deque._end--;
        uint256 _length = deque._values.length;
        bytes32 _value = deque._values[_end % _length];
        deque._values[_end % _length] = bytes32(0);
        deque._values.pop();
        return _value;
    }
    function popFront(Deque storage deque) internal returns (bytes32) {
        if (deque._start > deque._end) {
            if (deque._start == deque._end) {
                revert QueueEmpty();
            }
        } else {
            if (deque._end == deque._start) {
                revert QueueEmpty();
            }
        }
        uint256 _start = deque._start;
        deque._start++;
        uint256 _length = deque._values.length;
        bytes32 _value = deque._values[_start % _length];
        deque._values[_start % _length] = bytes32(0);
        deque._values.pop();
        return _value;
    }
    function front(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque._start);
    }
    function back(Deque storage deque) internal view returns (bytes32) {
        return _at(deque, deque._end - 1);
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
            return deque._start - deque._end;
        } else {
            return deque._end - deque._start;
        }
    }
    function empty(Deque storage deque) internal view returns (bool) {
        return length(deque) == 0;
    }
}
