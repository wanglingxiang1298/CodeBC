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
    event QueueEmpty();
    event QueueFull();
    event QueueOutOfBounds();
    mapping(address => Queue) private queues;
    function getQueue(address _address) public view returns (Queue memory) {
        return queues[_address];
    }
    function enqueue(address _address, bytes32 value) public {
        Queue memory queue = queues[_address];
        if (queue.isFull) {
            emit QueueFull();
            return;
        }
        queue.data.push(value);
        queue.length++;
            queue.isFull = true;
        }
    }
    function dequeue(address _address) public {
        Queue memory queue = queues[_address];
        if (queue.isEmpty) {
            emit QueueEmpty();
            return;
        }
        queue.data.shift();
        queue.length--;
        if (queue.length == 0) {
            queue.isEmpty = true;
        }
    }
    function front(address _address) public view returns (bytes32) {
        Queue memory queue = queues[_address];
        if (queue.isEmpty) {
            emit QueueEmpty();
            return bytes32(0);
        }
        return queue.data[queue.front];
    }
    function back(address _address) public view returns (bytes32) {
        Queue memory queue = queues[_address];
        if (queue.isEmpty) {
            emit QueueEmpty();
            return bytes32(0);
        }
        return queue.data[queue.back];
    }
    function at(address _address, uint256 _index) public view returns (bytes32) {
        Queue memory queue = queues[_address];
        if (queue.isEmpty || _index >= queue.length) {
            emit QueueOutOfBounds();
            return bytes32(0);
        }
        return queue.data[_index];
    }
    function clear(address _address) public {
        Queue memory queue = queues[_address];
        queue.front = 0;
        queue.back = 0;
        queue.length = 0;
        queue.isFull = false;
        queue.isEmpty = true;
        queue.data.clear();
        emit QueueEmpty();
    }
    function length(address _address) public view returns (uint256) {
        Queue memory queue = queues[_address];
        return queue.length;
    }
    function empty(address _address) public view returns (bool) {
        Queue memory queue = queues[_address];
        return queue.isEmpty;
    }
}