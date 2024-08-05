pragma solidity ^0.8.20;
library DoubleEndedQueue {
    struct Queue {
        bytes32[] data;
        uint256 front;
        uint256 back;
        uint256 length;
        bool isFull;
        bool isEmpty;
    }
    event QueuePopFront {
        address indexed sender;
        bytes32 oldFront;
        bytes32 newFront;
    }
    event QueuePopBack {
        address indexed sender;
        bytes32 oldBack;
        bytes32 newBack;
    }
    event QueuePushFront {
        address indexed sender;
        bytes32 value;
        bytes32 oldFront;
        bytes32 newFront;
    }
    event QueuePushBack {
        address indexed sender;
        bytes32 value;
        bytes32 oldBack;
        bytes32 newBack;
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
        uint256 newFront;
        uint256 newBack;
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
    modifier onlySender($(_origin.sender)) {
        require(msg.sender == _origin.sender, "Only the sender can perform this operation");
        _;
    }
    modifier onlyFront() {
        require(!Q.isEmpty, "The queue is empty");
        _;
    }
    modifier onlyBack() {
        require(!Q.isEmpty, "The queue is empty");
        _;
    }
    modifier onlyAt(uint256 index) {
        require(index >= 0 && index < Q.length, "Invalid index");
        _;
    }
    modifier onlyClear() {
        require(Q.length > 0, "The queue is empty");
        _;
    }
    modifier onlyLength() {
        _;
    }
    modifier onlyEmpty() {
        require(Q.isEmpty, "The queue is not empty");
        _;
    }
    modifier onlyFull() {
        require(Q.isFull, "The queue is not full");
        _;
    }
    modifier onlyNonEmpty() {
        require(!Q.isEmpty, "The queue is empty");
        _;
    }
    modifier onlyNonFull() {
        require(!Q.isFull, "The queue is full");
        _;
    }
    modifier onlyNonEmptyAndNonFull() {
        require(!Q.isEmpty && !Q.isFull, "The queue is either empty or full");
        _;
    }
    modifier onlyFrontAndNonEmpty() {
        require(!Q.isEmpty, "The front element is empty");
        _;
    }
    modifier onlyFrontAndNonFull() {
        require(!Q.isFull, "The front element is full");
        _;
    }
    modifier onlyBackAndNonEmpty() {
        require(!Q.isEmpty, "The back element is empty");
        _;
    }
    modifier onlyBackAndNonFull() {
        require(!Q.isFull, "The back element is full");
        _;
    }
    modifier onlyNonEmptyAndFront() {
        require(!Q.isEmpty, "The queue is empty");
        _;
    }
    modifier onlyNonFullAndFront() {
        require(!Q.isFull, "The queue is full");
        _;
    }
    modifier onlyNonEmptyAndBack() {
        require(!Q.isEmpty, "The queue is empty");
        _;
    }
    modifier onlyNonFullAndBack() {
        require(!Q.isFull, "The queue is full");
        _;
    }
    modifier onlyNonEmptyAndFrontAndNonEmpty() {
        require(!Q.isEmpty, "The queue is empty");
        require(!Q.isEmpty, "The front element is empty");
        _;
    }
    modifier onlyNonFullAndFrontAndNonFull() {
        require(!Q.isFull, "The queue is full");
        require(!Q.isFull, "The front element is full");
        _;
    }
    modifier onlyNonEmptyAndBackAndNonEmpty() {
        require(!Q.isEmpty, "The queue is empty");
        require(!Q.isEmpty, "The back element is empty");
        _;
    }
    modifier onlyNonFullAndBackAndNonFull() {
        require(!Q.isFull, "The queue is full");
        require(!Q.isFull, "The back element is full");
        _;
    }
    modifier onlyNonEmptyAndFrontAndNonEmptyAndNonFull() {
        require(!Q.isEmpty, "The queue is empty");
        require(!Q.isEmpty, "The front element is empty");
        require(!Q.isFull, "The front element is full");
        _;
    }
    modifier onlyNonFullAndFrontAndNonFullAndNonEmpty() {
        require(!Q.isFull, "The queue is full");
        require(!Q.isEmpty, "The front element is empty");
        require(!Q.isFull, "The front element is full");
        _;
    }
    modifier onlyNonEmptyAndBackAndNonEmptyAndNonFull()