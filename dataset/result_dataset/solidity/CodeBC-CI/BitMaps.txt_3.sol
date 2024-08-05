pragma solidity ^0.8.20;
library BitMaps {
    uint256 constant SLICE_MASK = (1 << 128) - 1;
    uint256 constant BITMAP_MASK = type(uint256).max;
    uint256[] bitmaps;
    uint256 bitmapLength;
    constructor() {
        bitmapLength = 1;
    }
    function get(uint256 index) public view returns (uint256) {
        uint256 sliceIndex = index >> 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << (index & 127))lic {
        uint256 sliceIndex = index >> 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << (index & 127)) - 1;
        bitmaps[sliceIndex] = (slice & ~mask) | (value << (index & 127));
        if (sliceIndex >= bitmapLength) {
            bitmapLength = sliceIndex + 1;
        }
    }
    function set(uint256 index) public {
        uint256 sliceIndex = index >> 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << (index & 127)) - 1;
        bitmaps[sliceIndex] = slice | mask;
        if (sliceIndex >= bitmapLength) {
            bitmapLength = sliceIndex + 1;
        }
    }
    function unset(uint256 index) public {
        uint256 sliceIndex = index >> 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << (index & 127)) - 1;
        bitmaps[sliceIndex] = slice & ~mask;
        if (sliceIndex >= bitmapLength) {
            bitmapLength = sliceIndex + 1;
        }
    }
}