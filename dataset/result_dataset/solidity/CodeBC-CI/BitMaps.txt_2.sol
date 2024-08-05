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
        uint256 sliceIndex = index / 128;
        uint256 bitIndex = index % 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << bitIndex);
        return (slice & mask) >> bitIndex;
    }
    function setTo(uint256 index, uint256 value) public {
        uint256 sliceIndex = index / 128;
        uint256 bitIndex = index % 128;
        uint256 slice = bitmaps[sliceIndex];
        uint256 mask = (1 << bitIndex);
        if (value > 0) {
            slice |= mask;
        } else {
            slice &= ~mask;
        }
        bitmaps[sliceIndex] = slice;
    }
    function set(uint256 index) public {
        setTo(index, 1);
    }
    function unset(uint256 index) public {
        setTo(index, 0);
    }
    function expandBitmap() internal {
        uint256 newLength = bitmapLength << 1;
        uint256[]  }
        }
        bitmapLength = newLength;
    }
} 
          
