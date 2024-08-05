pragma solidity ^0.8.20;
library BitMaps {
    struct BitMap {
        uint256[] data;
        uint256 mask;
    }
    function get(uint256 index) internal view returns (bool) {
        index = index & (index << 1);
        return ((bitmaps[msg.sender].mask & index) != 0) ? true : false;
    }
    function setTo(uint256 index, bool value) internal {
        index = index & (index << 1);
        if (value) {
            bitmaps[msg.sender].mask |= index;
        } else {
            bitmaps[msg.sender].mask &= ~index;
        }
    }
    function set(uint256 index) internal {
        setTo(index, true);
    }
    function unset(uint256 index) internal {
        setTo(index, false);
    }
    mapping(address => BitMap) bitmaps;
    function MyContract() {
        bitmaps[msg.sender] = BitMap({ data: [], mask: 0 });
    }
}