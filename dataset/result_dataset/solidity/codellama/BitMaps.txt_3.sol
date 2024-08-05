pragma solidity ^0.8.20;

library BitMaps {
    struct Bitmap {
        mapping(uint => uint) _bits;
    }

    function get(Bitmap storage bitmap, uint index) public view returns (uint) {
        return bitmap._bits[index];
    }

    function setTo(Bitmap storage bitmap, uint index, uint value) public {
        bitmap._bits[index] = value;
    }

    function set(Bitmap storage bitmap, uint index) public {
        bitmap._bits[index] = 1;
    }

    function unset(Bitmap storage bitmap, uint index) public {
        bitmap._bits[index] = 0;
    }
}