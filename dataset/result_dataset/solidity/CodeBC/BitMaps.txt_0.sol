pragma solidity ^0.8.20;
contract BitMaps {
    uint256 private bits;
    constructor() {
        bits = 0;
    }
    function get(uint256 index) public view returns (uint8) {
        uint256 mask = (1 << index % 256);
        if ((bits & mask) == mask) {
            return 1;
        } else {
            return 0;
        }
    }
    function setTo(uint256 index, uint8 value) public {
        uint256 mask = (1 << index % 256);
        if (value == 1) {
            bits = bits | mask;
        } else {
            bits = bits & ~mask;
        }
    }
    function set(uint256 index) public {
        setTo(index, 1);
    }
    function unset(uint256 index) public {
        setTo(index, 0);
    }
}

