pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        uint256[] data;
        uint256 head;
        uint256 tail;
        uint256 size;
    }
    event QueueEmpty();
    event QueueFull();
    event QueueOutOfBounds();
    function Queue(uint256 length) {
        head = 0;
        tail = 0;
        size = 0;
        data = new uint256[](length);
    }
    modifier onlyOnce() {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithData(bytes32 data) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithData(data);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndex(bytes32 data, uint256 index) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndex(data, index);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexAndValue(bytes32 data, uint256 index, bytes32 value) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexAndValue(data, index, value);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexes(bytes32 data, uint256 index1, uint256 index2) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexes(data, index1, index2);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndValues(bytes32 data, bytes32 value1, bytes32 value2) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndValues(data, value1, value2);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexesAndValues(bytes32 data, uint256 index1, uint256 index2, bytes32 value1, bytes32 value2) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexesAndValues(data, index1, index2, value1, value2);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexesAndValuesAndTimeout(bytes32 data, uint256 index1, uint256 index2, bytes32 value1, bytes32 value2, uint256 timeout) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexesAndValuesAndTimeout(data, index1, index2, value1, value2, timeout);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexesAndValuesAndTimeoutAndDelay(bytes32 data, uint256 index1, uint256 index2, bytes32 value1, bytes32 value2, uint256 timeout, uint256 delay) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexesAndValuesAndTimeoutAndDelay(data, index1, index2, value1, value2, timeout, delay);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    modifier onlyOnceWithDataAndIndexesAndValuesAndTimeoutAndDelayAndGasPrice(bytes32 data, uint256 index1, uint256 index2, bytes32 value1, bytes32 value2, uint256 timeout, uint256 delay, uint256 gasPrice) {
        require(!isStarted(), "Queue already started");
        _onlyOnce();
        _startWithDataAndIndexesAndValuesAndTimeoutAndDelayAndGasPrice(data, index1, index2, value1, value2, timeout, delay, gasPrice);
        _onlyOnce();
        _start();
        _onlyOnce();
    }
    function isStarted() public view returns (bool) {
        return !isEmpty();
    }
    function isEmpty() public view returns (bool) {
        require(size > 0, "Queue is empty");
        return size == 0;
    }
    function isFull() public view returns (bool) {
        require(size < data.length, "Queue is full");
        return size == data.length;
    }
    function pushBack(bytes32 value) public onlyOnceWithDataAndIndexAndValue(bytes32(msg.sender), size) {
        require(!isFull(), "Queue is full");
        data[tail] = value;
        tail = (tail + 1) % data.length;
        size++;
        emit PushBack(value);
    }
    function popBack() public onlyOnceWithDataAndIndex(bytes32(msg.sender), size - 1) returns (bytes32) {
        require(!isEmpty(), "Queue is empty");
        bytes32 value = data[tail - 1];
        tail = (tail - 1 + data.length) % data.length;
        size--;
        emit PopBack(value);
        return value;
    }
    function pushFront(bytes32 value) public onlyOnce