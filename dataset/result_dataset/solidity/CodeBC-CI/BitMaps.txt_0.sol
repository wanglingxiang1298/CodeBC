library BitMaps {
    uint256 constant SLICE_MASK = (1 << 128) - 1;
    uint256 constant BITMAP_MASK = type(uint256).max;
    uint256[] bitmaps;
    uint256 length;
    constructor() {
        length = 1024;
        bitmaps = new uint256[](length);
    }
    function get(uint256 index) public view returns (uint256) {
        uint256 sliceIndex = index >> 6;
        uint256 bitIndex = index & 63;
        uint256 slice = bitmaps[sliceIndex] >> bitIndex;
        return (slice & 1);
    }
    function setTo(uint256 index, uint256 value) public {
        uint256 sliceIndex = index >> 6;
        uint256 bitIndex = index & 63;
        uint256 slice = bitmaps[sliceIndex] & ~(1 << bitIndex);
        bitmaps[sliceIndex] = slice | (value << bitIndex);
    }
    function set(uint256 index) public {
        uint256 sliceIndex = index >> 6;
        uint256 bitIndex = index & 63;
        uint256 slice = bitmaps[sliceIndex] & ~(1 << bitIndex);
        bitmaps[sliceIndex] = slice | (1 << bitIndex);
    }
    function unset(uint256 index) public {
        uint256 sliceIndex = index >> 6;
        uint256 bitIndex = index & 63;
        uint256 slice = bitmaps[sliceIndex] & ~(1 << bitIndex);
        bitmaps[sliceIndex] = slice;
    }
    function resize(uint256 newLength) public {
        uint256[] storage oldBitmaps = bitmaps;
        uint256 oldLength = length;
        if (newLength > oldLength) {
            length = newLength;
            oldBitmaps.length = length;
            for (uint256 i = oldLength; i < length; i++) {
                oldBitmaps[i] = 0;
            }
        } else {
            length = newLength;
            oldBitmaps.length = length;
        }
    }
    function length() public view returns (uint256) {
        return length;
    }
}