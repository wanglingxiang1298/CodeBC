pragma solidity ^0.8.20;
library BitMaps {
    uint256 constant SLICE_MASK = (1 << 128) - 1;
    uint256[2] bitmaps;
    function get(uint256 index) public view returns (uint256) {
        uint256 slice = index / 128;
        uint256 shift = index % 128;
        uint256 value = bitmaps[slice];
        value = (value >> shift) & 1;
        return value;
    }
    function setTo(uint256 index, uint256 value) public {
        uint256 slice = index / 128;
        uint256 shift = index % 128;
        bitmaps[slice] &= ~(1 << shift);
        bitmaps[slice] |= (value << shift) & 1;
    }
    function set(uint256 index) public {
        setTo(index, 1);
    }
    function unset(uint256 index) public {
        setTo(index, 0);
    }
}