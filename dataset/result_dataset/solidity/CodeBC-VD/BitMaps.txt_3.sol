pragma solidity ^0.8.20;
library BitMaps {
    struct Bitmap {
        uint256 _val;
        uint256 _len;
    }
    function init(Bitmap storage bitmap) internal {
        bitmap._val = 0;
        bitmap._len = 0;
    }
    function get(Bitmap storage bitmap, uint256 index) public view returns (uint256) {
        return ((bitmap._val >> index) & 1);
    }
    function setTo(Bitmap storage bitmap, uint256 index, uint256 value) public {
        bitmap._val &= ~(1 << index);
        bitmap._val |= (value & 1) << index;
    }
    function set(Bitmap storage bitmap, uint256 index) public {
        setTo(bitmap, index, 1);
    }
    function unset(Bitmap storage bitmap, uint256 index) public {
        setTo(bitmap, index, 0);
    }
}

