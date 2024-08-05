solidity^0.8.20
library BitMaps {
    struct BitMap {
        uint256[] data;
        uint256 mask;
    }
    function init(uint256 size) public {
        mask = (1 << size) - 1;
    }
    function get(uint256 index) public view returns (bool) {
        uint256 offset = index / 256;
        uint256 bitIndex = index % 256;
        uint256 byteIndex = offset / 32;
        uint256 bitBitIndex = bitIndex % 32;
        uint256 bit = ((uint256(this.data[byteIndex]) >> bitBitIndex) & 1);
        return bit == 1;
    }
    function set(uint256 index, bool value) public {
        uint256 offset = index / 256;
        uint256 bitIndex = index % 256;
        uint256 byteIndex = offset / 32;
        uint256 bitBitIndex = bitIndex % 32;
        uint256 byte = uint256(this.data[byteIndex]);
        if (value) {
            byte |= (1 << bitBitIndex);
        } else {
            byte &= ~(1 << bitBitIndex);
        }
        this.data[byteIndex] = uint256(byte);
    }
    function setTo(uint256 index) public {
        set(index, true);
    }
    function unset(uint256 index) public {
        set(index, false);
    }
    function isFull() public view returns (bool) {
        return (mask == 0);
    }
    function isEmpty() public view returns (bool) {
        return (mask != 0);
    }
    function contains(uint256 index) public view returns (bool) {
        return (mask & (1 << index)) != 0;
    }
    function containsAtLeast(uint256 count) public view returns (bool) {
        return (mask >= (1 << count));
    }
    function containsLessThan(uint256 count) public view returns (bool) {
        return (mask < (1 << count));
    }
    function containsAtMost(uint256 count) public view returns (bool) {
        return (mask <= (1 << count));
    }
    function numSetBits() public view returns (uint256) {
        return countSetBits(mask);
    }
    function countSetBits(uint256 n) internal pure returns (uint256) {
        n = (n & 0x5555555555555555);
        n = (n & 0x3333333333333333) + ((n >> 2) &