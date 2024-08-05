pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        uint256[] data;
        uint256 head;
        uint256 tail;
        uint256 size;
        bool isFull;
    }
    uint256 private constant MAX_SIZE = 10000;
    event QueueEmpty();
    event QueueFull();
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this operation");
        _;
    }
    function DoubleEndedQueue() {
        head = 0;
        tail = 0;
        size = 0;
        isFull = false;
    }
    function pushBack(bytes32 value) public {
        require(size < MAX_SIZE, "Queue is full");
        data[tail] = value;
        tail = (tail + 1) % MAX_SIZE;
        size++;
        emit Queue(data, head, tail, size, isFull);
    }
    function popBack() public {
        require(size > 0, "Queue is empty");
        bytes32 memory result = data[head];
        data[head] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        head = (head + 1) % MAX_SIZE;
        size--;
        emit Queue(data, head, tail, size, isFull);
        return result;
    }
    function pushFront(bytes32 value) public {
        require(size < MAX_SIZE, "Queue is full");
        data[head] = value;
        head = (head - 1 + MAX_SIZE) % MAX_SIZE;
        size++;
        emit Queue(data, head, tail, size, isFull);
    }
    function popFront() public {
        require(size > 0, "Queue is empty");
        bytes32 memory result = data[tail];
        data[tail] = 0x0000000000000000000000000000000000000000000000000000000000000000;
        tail = (tail - 1 + MAX_SIZE) % MAX_SIZE;
        size--;
        emit Queue(data, head, tail, size, isFull);
        return result;
    }
    function front() public view returns (bytes32) {
        require(size > 0, "Queue is empty");
        return data[head];
    }
    function back() public view returns (bytes32) {
        require(size > 0, "Queue is empty");
        return data[tail];
    }
    function at(uint index) public view returns (bytes32) {
        require(size > 0, "Queue is empty");
        require(index >= 0 && index < size, "Index out of bounds");
        return data[(head + index) % MAX_SIZE];
    }
    function clear() public onlyOwner {
        head = 0;
        tail = 0;
        size = 0;
        isFull = false;
        emit Queue(data, head, tail, size, isFull);
    }
    function length() public view returns (uint) {
        return size;
    }
    function empty() public view returns (bool) {
        return size == 0;
    }
}