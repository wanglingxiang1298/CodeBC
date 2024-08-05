pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        bytes32[] _values;
        uint256 _start;
        uint256 _end;
    }
    error QueueEmpty();
    error QueueFull();
    error QueueOutOfBounds(uint256 _index);
    function _pushBack(Queue storage _queue, bytes32 _value) internal {
        if (_queue._values.length == _queue._end) {
            revert QueueFull();
        }
        _queue._values[_queue._end] = _value;
        _queue._end = _queue._end + 1;
    }
    function _pushFront(Queue storage _queue, bytes32 _value) internal {
        if (_queue._values.length == _queue._start) {
            revert QueueFull();
        }
        _queue._start = _queue._start - 1;
        if (_queue._start < 0) {
            _queue._start = _queue._start + _queue._values.length;
        }
        _queue._values[_queue._start] = _value;
    }
    function _popBack(Queue storage _queue) internal returns (bytes32) {
        if (_queue._start == _queue._end) {
            revert QueueEmpty();
        }
        _queue._end = _queue._end - 1;
        if (_queue._end < 0) {
            _queue._end = _queue._end + _queue._values.length;
        }
        return _queue._values[_queue._end];
    }
    function _popFront(Queue storage _queue) internal returns (bytes32) {
        if (_queue._start == _queue._end) {
            revert QueueEmpty();
        }
        bytes32 value = _queue._values[_queue._start];
        _queue._start = _queue._start + 1;
        if (_queue._start == _queue._values.length) {
            _queue._start = 0;
        }
        return value;
    }
    function _at(Queue storage _queue, uint256 _index) internal view returns (bytes32) {
        if (_index >= _queue._values.length) {
            revert QueueOutOfBounds(_index);
        }
        uint256 index = _queue._start + _index;
        if (index >= _queue._values.length) {
            index = index - _queue._values.length;
        }
        return _queue._values[index];
    }
    function _clear(Queue storage _queue) internal {
        _queue._start = 0;
        _queue._end = 0;
        delete _queue._values;
    }
    function _length(Queue storage _queue) internal view returns (uint256) {
        if (_queue._start <= _queue._end) {
            return _queue._end - _queue._start;
        } else {
            return _queue._end - _queue._start + _queue._values.length;
        }
    }
    function _empty(Queue storage _queue) internal view returns (bool) {
        return _queue._start == _queue._end;
    }
}