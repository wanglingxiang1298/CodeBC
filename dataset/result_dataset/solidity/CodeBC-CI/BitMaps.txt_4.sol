pragma solidity ^0.8.20;
library BitMaps {
    uint256 constant SLICE_MASK = (1 << 128 - 64) - 1;
    uint256 constant BITMAP_MASK = type(uint256).max >> (128 - bitLength);
    uint256 constant BITMAP_SHIFT = 128 - bitLength;
    function get(uint256 bitmap, uint256 index) public pure returns (uint256) {
        uint256 sliceIndex = index >> 6;
        uint256 slice = bitmap >> (sliceIndex << 6);
        uint256 bitIndex = index & 0x3F;
        return (slice >> bitIndex) & 1;
    }
    function setTo(uint256 bitmap, uint256 index, uint256 value) public pure returns (uint256) {
        uint256 sliceIndex = index >> 6;
        uint256 sliceMask = SLICE_MASK << (sliceIndex << 6);
        uint256 newSlice = (sliceMask unction set(uint256 bitmap, uint256 index) public pure {
        _setTo(bitmap, index, 1);
    }
    function unset(uint256 bitmap, uint256 index) public pure {
        _setTo(bitmap, index, 0);
    }
}