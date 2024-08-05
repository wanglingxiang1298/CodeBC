pragma solidity ^0.8.20;
contract BitMaps {
    uint256 constant MAX_BITMAP_LENGTH = 1024;
    uint256 constant MAX_BITMAP_BYTE_LENGTH = MAX_BITMAP_LENGTH / 8;
    bytes32 constant BITMAP_MASK = bytes32(type(uint256).max);
    bytes32 private bitmap;
    constructor(bytes32 _bitmap) {
        bitmap = _bitmap;
    }
    function get(uint256 _index) public view returns (uint8) {
        uint256 byteIndex = _index / 8;
        uint256 bitIndex = _index % 8;
        bytes32 mask = bytes32(uint256(BITMAP_MASK) << bitIndex);
        if (uint256(bitmap & mask) >> 255 == 1) {
            return 1;
        } else {
            return 0;
        }
    }
    function setTo(uint256 _index, uint8 _value) public {
        require(_index < MAX_BITMAP_LENGTH, "Bitmap: INDEX_OUT_OF_BOUNDS");
        uint256 byteIndex = _index / 8;
        uint256 bitIndex = _index % 8;
        if (_value == 1) {
            bitmap |= bytes32(uint256(BITMAP_MASK) << bitIndex);
        } else {
            bitmap &= ~bytes32(uint256(BITMAP_MASK) << bitIndex);
        }
    }
    function set(uint256 _index) public {
        setTo(_index, 1);
    }
    function unset(uint256 _index) public {
        setTo(_index, 0);
    }
    function getBitmap() public view returns (bytes32) {
        return bitmap;
    }
}