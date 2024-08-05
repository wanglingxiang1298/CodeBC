pragma solidity ^0.8.20;
contract DoubleEndedQueue {
    using DoubleEndedQueue for Deque;
    Deque deque;
    constructor() {
        deque = Deque();
    }
    function pushBack(bytes32 _value) public {
        deque.pushBack(_value);
    }
    function popBack() public returns (bytes32 _value) {
        return deque.popBack();
    }
    function pushFront(bytes32 _value) public {
        deque.pushFront(_value);
    }
    function popFront() public returns (bytes32 _value) {
        return deque.popFront();
    }
    function front() public view returns (bytes32 _value) {
        return deque.front();
    }
    function back() public view returns (bytes32 _value) {
        return deque.back();
    }
    function at(uint256 _index) public view returns (bytes32 _value) {
        return deque.at(_index);
    }
    function clear() public {
        deque.clear();
    }
    function length() public view returns (uint256 _length) {
        return deque.length();
    }
    function empty() public view returns (bool _empty) {
        return deque.empty();
    }
}