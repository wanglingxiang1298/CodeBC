pragma solidity ^0.8.20;

library BitMaps {
    struct Bitmap {
        uint256[] data;
        uint256 length;
    }

    function get(Bitmap storage bitmap, uint256 index) public view returns (uint256) {
        require(index < bitmap.length, "Index out of bounds");
        return bitmap.data[index];
    }

    function setTo(Bitmap storage bitmap, uint256 index, uint256 value) public {
        require(index < bitmap.length, "Index out of bounds");
        bitmap.data[index] = value;
    }

    function set(Bitmap storage bitmap, uint256 index) public {
        require(index < bitmap.length, "Index out of bounds");
        bitmap.data[index] = 1;
    }

    function unset(Bitmap storage bitmap, uint256 index) public {
        require(index < bitmap.length, "Index out of bounds");
        bitmap.data[index] = 0;
    }
}