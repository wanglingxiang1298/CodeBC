pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        uint256[] data;
        uint256 head;
        uint256 tail;
        uint256 size;
        bool isEmpty;
        bool isFull;
    }
    event QueueEmpty();
    event QueueFull();
    function Queue() {
        queue.data = new uint256[](1);
        queue.head = 0;
        queue.tail = 0;
        queue.size = 0;
        queue.isEmpty = true;
        queue.isFull = false;
    }
    modifier onlyFront() {
        require(queue.head == 0, "Queue: queue is not empty");
        _;
    }
    modifier onlyBack() {
        require(queue.tail == 0, "Queue: queue is not empty");
        _;
    }
    function pushBack(bytes32 value) {
        require(queue.size < queue.data.length, "Queue: queue is full");
        queue.data[queue.tail] = value;
        queue.tail++;
        queue.size++;
        if (queue.tail == queue.data.length) {
            queue.tail = 0;
        }
        if (queue.size == 1) {
            queue.isEmpty = false;
        }
        queue.isFull = false;
        emit NewValue(value);
    }
    function popBack() {
        require(queue.size > 0, "Queue: queue is empty");
        uint256 index = queue.tail - 1;
        if (index < 0) {
            index = queue.data.length - 1;
        }
        bytes32 result = queue.data[index];
        queue.tail--;
        queue.size--;
        if (queue.tail == 0) {
            queue.tail = queue.data.length;
        }
        if (queue.size == 0) {
            queue.isEmpty = true;
        }
        queue.isFull = (queue.size == queue.data.length);
        emit RemoveValue(result);
        return result;
    }
    function pushFront(bytes32 value) {
        require(queue.size < queue.data.length, "Queue: queue is full");
        queue.data[queue.head] = value;
        queue.head++;
        queue.size++;
        if (queue.head == queue.data.length) {
            queue.head = 0;
        }
        if (queue.size == 1) {
            queue.isEmpty = false;
        }
        queue.isFull = false;
        emit NewValue(value);
    }
    function popFront() {
        require(queue.size > 0, "Queue: queue is empty");
        bytes32 result = queue.data[queue.head - 1];
        queue.head--;
        queue.size--;
        if (queue.head == queue.data.length) {
            queue.head = 0;
        }
        if (queue.size == 0) {
            queue.isEmpty = true;
        }
        queue.isFull = (queue.size == queue.data.length);
        emit RemoveValue(result);
        return result;
    }
    function front() public view returns (bytes32) {
        require(queue.size > 0, "Queue: queue is empty");
        return queue.data[queue.head - 1];
    }
    function back() public view returns (bytes32) {
        require(queue.size > 0, "Queue: queue is empty");
        uint256 index = queue.tail - 1;
        if (index < 0) {
            index = queue.data.length - 1;
        }
        return queue.data[index];
    }
    function at(uint256 index) public view returns (bytes32) {
        require(index >= 0 && index < queue.size, "Queue: invalid index");
        uint256 resultIndex = queue.head + index;
        if (resultIndex >= queue.data.length) {
            resultIndex = resultIndex - queue.data.length;
        }
        return queue.data[resultIndex];
    }
    function clear() public {
        require(queue.size > 0, "Queue: queue is empty");
        queue.head = 0;
        queue.tail = 0;
        queue.size = 0;
        queue.isEmpty = true;
        queue.isFull = false;
        emit QueueCleared();
    }
    function length() public view returns (uint256) {
        return queue.size;
    }
    function empty() public view returns (bool) {
        return queue.size == 0;
    }
    event NewValue(bytes32 value);
    event RemoveValue(bytes32 value);
    event QueueCleared();
    modifier onlyClear() {
        require(queue.size > 0, "Queue: queue is not empty");
        _;
    }
    function getFront() public view returns (bytes32) {
        require(queue.size > 0, "Queue: queue is empty");
        return queue.data[queue.head - 1];
    }
    function getBack() public view returns (bytes32) {
        require(queue.size > 0, "Queue: queue is empty");
        uint256 index = queue.tail - 1;
        if (index < 0) {
            index = queue.data.length - 1;
        }
        return queue.data[index];
    }
}