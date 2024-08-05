pragma solidity ^0.8.20;

import "DoubleEndedQueue.sol";

contract Deque {
    using DoubleEndedQueue for DoubleEndedQueue.Deque;

    DoubleEndedQueue.Deque private _deque;

    constructor() public {
        _deque = new DoubleEndedQueue.Deque();
    }

    function pushBack(bytes32 value) public {
        _deque.pushBack(value);
    }

    function popBack() public returns (bytes32) {
        return _deque.popBack();
    }

    function pushFront(bytes32 value) public {
        _deque.pushFront(value);
    }

    function popFront() public returns (bytes32) {
        return _deque.popFront();
    }

    function front() public view returns (bytes32) {
        return _deque.front();
    }

    function back() public view returns (bytes32) {
        return _deque.back();
    }

    function at(uint256 index) public view returns (bytes32) {
        return _deque.at(index);
    }

    function clear() public {
        _deque.clear();
    }

    function length() public view returns (uint256) {
        return _deque.length();
    }

    function empty() public view returns (bool) {
        return _deque.empty();
    }
}