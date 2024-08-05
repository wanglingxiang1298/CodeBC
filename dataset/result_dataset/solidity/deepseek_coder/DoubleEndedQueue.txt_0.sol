pragma solidity ^0.8.20;
import "./DoubleEndedQueue.sol";
contract Queue {
    private DoubleEndedQueue<bytes32> _queue;
    function pushBack(bytes32 value) public {
        _queue.pushBack(value);
    }
    function popBack() public returns (bytes32) {
        return _queue.popBack();
    }
    function pushFront(bytes32 value) public {
        _queue.pushFront(value);
    }
    function popFront() public returns (bytes32) {
        return _queue.popFront();
    }
    function front() public view returns (bytes32) {
        return _queue.front();
    }
    function back() public view returns (bytes32) {
        return _queue.back();
    }
    function at(uint index) public view returns (bytes32) {
        return _queue.at(index);
    }
    function clear() public {
        _queue.clear();
    }
    function length() public view returns (uint) {
        return _queue.length();
    }
    function empty() public view returns (bool) {
        return _queue.empty();
    }
}