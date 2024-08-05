pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        bytes32[] data;
        uint256 front;
        uint256 back;
        uint256 count;
    }
    event QueuePopFront {
        address sender;
        bytes32 oldHead;
        bytes32 newHead;
    }
    event QueuePushBack {
        address sender;
        bytes32 oldTail;
        bytes32 newTail;
    }
    modifier onlySender(address) {
        require(msg.sender == this.sender);
        _;
    }
    modifier onlyFrontIsEmpty() {
        require(front == back);
        _;
    }
    modifier onlyFrontIsNotEmpty() {
        require(front != back);
        _;
    }
    modifier onlyBackIsEmpty() {
        require(front == back);
        _;
    }
    modifier onlyBackIsNotEmpty() {
        require(front != back);
        _;
    }
    modifier onlyBetweenFrontAndBack() {
        require(front < back);
        _;
    }
    modifier onlyFull() {
        require(count == capacity);
        _;
    }
    modifier onlyNotFull() {
        require(count < capacity);
        _;
    }
    modifier onlyEmpty() {
        require(front == back);
        _;
    }
    modifier onlyNotEmpty() {
        require(front != back);
        _;
    }
    modifier onlyBetweenFrontAndBack() {
        require(front < back);
        _;
    }
    modifier onlyBetweenFrontAndBackAndNotFull() {
        require(front < back && count < capacity);
        _;
    }
    modifier onlyBetweenFrontAndBackAndFull() {
        require(front < back && count == capacity);
        _;
    }
    uint256 public constant capacity = 256;
    mapping(address => uint256) public nonPayable sender;
    bytes32[] public data;
    uint256 public front;
    uint256 public back;
    uint256 public count;
    event QueuePopFront(address sender, bytes32 oldHead, bytes32 newHead);
    event QueuePushBack(address sender, bytes32 oldTail, bytes32 newTail);
    constructor() {
        data = new bytes32[];
        front = 0;
        back = 0;
        count = 0;
    }
    function enqueueFront(bytes32 value) public onlySender(msg.sender) onlyFull() {
        revert("Queue is full.");
    }
    function enqueueBack(bytes32 value) public onlySender(msg.sender) onlyFull() {
        revert("Queue is full.");
    }
    function dequeueFront() public onlySender(msg.sender) onlyNotEmpty() {
        bytes32 oldHead = data[front];
        front++;
        count--;
        emit QueuePopFront(msg.sender, oldHead, data[front]);
    }
    function dequeueBack() public onlySender(msg.sender) onlyNotEmpty() {
        bytes32 oldTail = data[back];
        back--;
        count--;
        emit QueuePopFront(msg.sender, oldTail, data[back]);
    }
    function getFront() public view onlyFrontNotEmpty() {
        return data[front];
    }
    function getBack() public view onlyBackNotEmpty() {
        return data[back];
    }
    function getAt(uint256 index) public view onlyBetweenFrontAndBack() {
        return data[index];
    }
    function clear() public onlySender(msg.sender) onlyEmpty() {
        front = 0;
        back = 0;
        count = 0;
        emit QueueClear(msg.sender);
    }
    function length() public view returns (uint256) {
        return count;
    }
    function empty() public view onlyFrontNotEmpty() {
        return front == back;
    }
    function pushFront(bytes32 value) public onlySender(msg.sender) onlyNotFull() {
        data.push(value);
        front++;
        count++;
        emit QueuePushFront(msg.sender, data[front - 1], data[front]);
    }
    function pushBack(bytes32 value) public onlySender(msg.sender) onlyNotFull() {
        data.push(value);
        back++;
        count++;
        emit QueuePushBack(msg.sender, data[back - 1], data[back]);
    }
    function popFront() public onlySender(msg.sender) onlyFrontNotEmpty() {
        bytes32 oldHead = data[front];
        front++;
        count--;
        emit QueuePopFront(msg.sender, oldHead, data[front]);
    }
    function popBack() public onlySender(msg.sender) onlyBackNotEmpty() {
        bytes32 oldTail = data[back];
        back--;
        count--;
        emit QueuePopBack(msg.sender, oldTail, data[back]);
    }
    function clear() public onlySender(msg.sender) onlyEmpty() {
        front = 0;
        back = 0;
        count = 0;
        emit QueueClear(msg.sender);
    }