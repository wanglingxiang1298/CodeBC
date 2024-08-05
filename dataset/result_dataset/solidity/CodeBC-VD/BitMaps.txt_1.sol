pragma solidity ^0.8.20;
library BitMaps {
    struct Bitmap {
        uint256 _map;
    }
    uint256 internal constant BITMAP_SIZE = 256;
    uint256 internal constant BITMAP_MASK = BITMAP_SIZE - 1;
    function get(Bitmap storage bitmap, uint256 index) public view returns (bool) {
        uint256 itemIndex = bitmap._map >> index;
        uint256 itemOffset = itemIndex & BITMAP_MASK;
        return (itemIndex!= 0);
    }
    function setTo(Bitmap storage bitmap, uint256 index, bool value) public {
        if (value) {
            bitmap._map |= MASK;
        } else {
            bitmap._map &= ~MASK;
        }
    }
    function set(Bitmap storage bitmap, uint256 index) public {
        bitmap._map |= MASK;
    }
    function unset(Bitmap storage bitmap, uint256 index) public {
        bitmap._map &= ~MASK;
    }
    function isEmpty(Bitmap storage bitmap) public view returns (bool) {
        return bitmap._map == 0;
    }
    function length(Bitmap storage bitmap) public view returns (uint256) {
        uint256 len = 0;
        uint256 map = bitmap._map;
        while (map!= 0) {
            len += (map & MASK)!= 0? 1 : 0;
            map = map >> 1;
        }
        return len;
    }
    function values(Bitmap storage bitmap) public view returns (uint256[] memory) {
        uint256 len = length(bitmap);
        uint256[] memory values_ = new uint256[](len);
        for (uint256 i = 0; i < len; i++) {
            uint256 index = 0;
            uint256 map = bitmap._map;
            while (map!= 0) {
                if ((map & MASK)!= 0) {
                    index++;
                    if (index == (i + 1)) {
                        break;
                    }
                }
                map = map >> 1;
            }
            values_[i] = index;
        }
        return values_;
    }
}