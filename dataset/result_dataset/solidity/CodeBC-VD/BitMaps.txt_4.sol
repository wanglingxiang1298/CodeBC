pragma solidity ^0.8.20;
library BitMaps {
    uint256 internal constant MAX_INDEX = type(uint256).max;
    function get(bytes32 bitmap, uint256 index) public pure returns (bool) {
        return (bitmap & bytes32(uint256(1) << index % 256))!= 0;
    }
    function setTo(bytes32 bitmap, uint256 index, bool value) public pure {
        if (value) {
            bitmap |= bytes32(uint256(1) << index % 256);
        } else {
            bitmap &= ~bytes32(uint256(1) << index % 256);
        }
    }
    function set(bytes32 bitmap, uint256 index) public pure {
        setTo(bitmap, index, true);
    }
    function unset(bytes32 bitmap, uint256 index) public pure {
        setTo(bitmap, index, false);
    }
    function bits(bytes32 bitmap) public pure returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 0; i < MAX_INDEX; i++) {
            if (get(bitmap, i)) {
                count++;
            }
        }
        return count;
    }
    function isEmpty(bytes32 bitmap) public pure returns (bool) {
        return bits(bitmap) == 0;
    }
    function isNotEmpty(bytes32 bitmap) public pure returns (bool) {
        return!isEmpty(bitmap);
    }
    function isFull(bytes32 bitmap) public pure returns (bool) {
        return bits(bitmap) == MAX_INDEX;
    }
    function isNotFull(bytes32 bitmap) public pure returns (bool) {
        return!isFull(bitmap);
    }
    function fromBoolArray(bool[] memory values) public pure returns (bytes32) {
        bytes32 result;
        for (uint256 i = 0; i < values.length; i++) {
            if (values[i]) {
                setTo(result, i, true);
            }
        }
        return result;
    }
    function toBoolArray(bytes32 bitmap) public pure returns (bool[] memory) {
        bool[] memory result = new bool[](MAX_INDEX);
        for (uint256 i = 0; i < MAX_INDEX; i++) {
            result[i] = get(bitmap, i);
        }
        return result;
    }
}