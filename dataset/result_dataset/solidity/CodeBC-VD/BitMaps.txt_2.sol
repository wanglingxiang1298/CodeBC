pragma solidity ^0.8.20;
contract BitMaps {
    uint256 private bits;
    constructor(uint256 _bits) {
        bits = _bits;
    }
    function get(uint256 _index) public view returns (uint8) {
        uint256 itemPosition = _index / 256;
        uint256 itemValue = uint256(bits >> itemPosition);
        uint256 mask = (1 << _index % 256);
        if (itemValue & mask == 0) {
            return 0;
        } else {
            return 1;
        }
    }
    function setTo(uint256 _index, uint8 _value) public {
        require(_value < 2, "BitMaps: value out of range");
        uint256 itemPosition = _index / 256;
        uint256 currentItemValue = uint256(bits >> itemPosition);
        uint256 mask = (1 << _index % 256);
        if (_value == 0) {
            bits = bits & ~(mask << itemPosition);
        } else {
            bits = bits | (mask << itemPosition);
        }
    }
    function set(uint256 _index) public {
        setTo(_index, 1);
    }
    function unset(uint256 _index) public {
        setTo(_index, 0);
    }
}