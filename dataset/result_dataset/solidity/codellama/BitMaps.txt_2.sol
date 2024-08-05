pragma solidity ^0.8.20;

library BitMaps {
    struct Bitmap {
        mapping(uint => uint) data;
    }

    function get(Bitmap storage bitmap, uint index) public view returns (uint) {
        return bitmap.data[index];
    }

    function setTo(Bitmap storage bitmap, uint index, uint value) public {
        bitmap.data[index] = value;
    }

    function set(Bitmap storage bitmap, uint index) public {
        bitmap.data[index] = 1;
    }

    function unset(Bitmap storage bitmap, uint index) public {
        bitmap.data[index] = 0;
    }
}