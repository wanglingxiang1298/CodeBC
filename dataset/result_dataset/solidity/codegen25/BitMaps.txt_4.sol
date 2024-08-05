pragma solidity ^0.8.20;
library BitMaps {
    function get(bytes32 memory b, uint256 index) internal view returns (bool) {
        uint256 mask = 1 << index;
        return b.value & mask != 0;
    }
    function setTo(bytes32 memory b, uint256 index, bool value) internal mutable returns (bytes32 memory) {
        uint256 mask = 1 << index;
        if (value) {
            b.value |= mask;
        } else {
            b.value &= ~mask;
        }
        return b;
    }
    function set(bytes32 memory b, uint256 index) internal mutable returns (bytes32 memory) {
        return setTo(b, index, true);
    }
    function unset(bytes32 memory b, uint256 index) internal mutable returns (bytes32 memory) {
        return setTo(b, index, false);
    }
}