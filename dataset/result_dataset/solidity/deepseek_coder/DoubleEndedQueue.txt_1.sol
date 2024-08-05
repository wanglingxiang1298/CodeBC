pragma solidity ^0.8.20;
import "./DoubleEndedQueue.sol";
contract Queue {
    using DoubleEndedQueue.sol as DequeLib {
        function pushBack(bytes32 value) public {
            DequeLib.pushBack(queue, value);
        }
        function popBack() public returns (bytes32) {
            return DequeLib.popBack(queue);
        }
        function pushFront(bytes32 value) public {
            DequeLib.pushFront(queue, value);
        }
        function popFront() public returns (bytes32) {
            return DequeLib.popFront(queue);
        }
        function front() public view returns (bytes32) {
            return DequeLib.front(queue);
        }
        function back() public view returns (bytes32) {
            return DequeLib.back(queue);
        }
        function at(uint index) public view returns (bytes32) {
            return DequeLib.at(queue, index);
        }
        function clear() public {
            DequeLib.clear(queue);
        }
        function length() public view returns (uint) {
            return DequeLib.length(queue);
        }
        function empty() public view returns (bool) {
            return DequeLib.empty(queue);
        }
    }
    constructor(uint _maxSize) public {
        queue = new DequeLib(bytes32[](2), _maxSize);
    }
}