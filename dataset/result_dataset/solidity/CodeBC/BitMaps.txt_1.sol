pragma solidity ^0.8.20;
library BitMaps {
    function get(bytes32 bitmap, uint256 index) public pure returns (bool) {
        uint256 itemIndex = index / 256;
        uint256 withinItemIndex = index % 256;
        bytes32 item = bitmap & bytes32(uint256(1) << withinItemIndex);
        return item!= bytes32(0);
    }
    function setTo(bytes32 bitmap, uint256 index, bool value) public pure {
        if (value) {
            bitmap = bitmap | bytes32(uint256(1) << index % 256);
        } else {
            bitmap = bitmap & ~(bytes32(uint256(1) << index % 256));
        }
    }
    function set(bytes32 bitmap, uint256 index) public pure {
        setTo(bitmap, index, true);
    }
    function unset(bytes32 bitmap, uint256 index) public pure {
        setTo(bitmap, index, false);
    }
}
