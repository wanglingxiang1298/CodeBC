pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        bytes32[] data;
        uint256 front;
        uint256 back;
        uint256 length;
    }
    event QueuePopFront {
        address indexed sender;
        bytes32 oldValue;
        bytes32 newValue;
    }
    event QueuePushBack {
        address indexed sender;
        bytes32 oldValue;
        bytes32 newValue;
    }
    event QueuePushFront {
        address indexed sender;
        bytes32 oldValue;
        bytes32 newValue;
    }
    event QueuePopBack {
        address indexed sender;
        bytes32 oldValue;
        bytes32 newValue;
    }
    event QueueFront {
        address indexed sender;
        bytes32 value;
    }
    event QueueBack {
        address indexed sender;
        bytes32 value;
    }
    event QueueAt {
        address indexed sender;
        bytes32 value;
        uint256 index;
    }
    event QueueClear {
        address indexed sender;
        uint256 oldFront;
        uint256 oldBack;
        uint256 oldLength;
        uint256 newFront;
        uint256 newBack;
        uint256 newLength;
    }
    event QueueLength {
        address indexed sender;
        uint256 length;
    }
    event QueueEmpty {
        address indexed sender;
    }
    event QueueFull {
        address indexed sender;
    }
    event QueueOutOfBounds {
        address indexed sender;
    }
    mapping(address => Queue) private queues;
    function addToQueue(bytes32 value, address sender) public {
        require(queues[sender].length < 100, "Queue full");
        queues[sender].data.push(value);
        queues[sender].length++;
        emit QueuePushBack(sender, value, value);
    }
    function popBack(address sender) public {
        require(queues[sender].length > 0, "Queue empty");
        bytes32 poppedValue = queues[sender].data.pop();
        queues[sender].back--;
        emit QueuePopBack(sender, poppedValue, queues[sender].data[queues[sender].back + 1]);
    }
    function pushFront(bytes32 value, address sender) public {
        require(queues[sender].length < 100, "Queue full");
        queues[sender].data.insert(0, value);
        queues[sender].front++;
        emit QueuePushFront(sender, queues[sender].data[queues[sender].front - 1], value);
    }
    function popFront(address sender) public {
        require(queues[sender].length > 0, "Queue empty");
        bytes32 poppedValue = queues[sender].data.shift();
        queues[sender].front--;
        emit QueuePopFront(sender, poppedValue, queues[sender].data[queues[sender].front + 1]);
    }
    function front(address sender) public view returns (bytes32) {
        require(queues[sender].length > 0, "Queue empty");
        emit QueueFront(sender, queues[sender].data[queues[sender].front]);
        return queues[sender].data[queues[sender].front];
    }
    function back(address sender) public view returns (bytes32) {
        require(queues[sender].length > 0, "Queue empty");
        emit QueueBack(sender, queues[sender].data[queues[sender].back]);
        return queues[sender].data[queues[sender].back];
    }
    function at(uint256 index, address sender) public view returns (bytes32) {
        require(queues[sender].length > index, "Queue out of bounds");
        emit QueueAt(sender, queues[sender].data[index], index);
        return queues[sender].data[index];
    }
    function clear(address sender) public {
        require(queues[sender].length > 0, "Queue empty");
        bytes32 oldFront = queues[sender].data[queues[sender].front];
        bytes32 oldBack = queues[sender].data[queues[sender].back];
        queues[sender].front = queues[sender].length - 1;
        queues[sender].back = 0;
        queues[sender].length = 0;
        emit QueueClear(sender, oldFront, oldBack, oldFront + oldBack, queues[sender].front, queues[sender].back, queues[sender].length);
    }
    function length(address sender) public view returns (uint256) {
        emit QueueLength(sender, queues[sender].length);
        return queues[sender].length;
    }
    function empty(address sender) public view returns (bool) {
        emit QueueEmpty(sender, queues[sender].length == 0);
        return queues[sender].length == 0;
    }
    function full(address sender) public view returns (bool) {
        emit QueueFull(sender, queues[sender].length == 100);
        return queues[sender].length == 100;
    }
    function outOfBounds(address sender) public view returns (bool) {
        emit QueueOutOfBounds(sender, queues[sender].front > queues[sender].back);