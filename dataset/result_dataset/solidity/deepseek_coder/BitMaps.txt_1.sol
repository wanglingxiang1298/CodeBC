pragma solidity ^0.8.20;
library BitMaps {
    function get(bytes32 memory b, uint256 i) internal view returns (bool) {
        uint256 res = 0;
        for (uint256 j = 0; j < 256; j++) {
            if ((b & uint256(1 << j)) != 0) {
                res |= uint256(1 << (255 - j));
            }
        }
        return res > 0 ? true : false;
    }
    function setTo(bytes32 memory b, uint256 i, uint256 value) internal pure returns (bytes32) {
        if (value > 0) {
            b |= uint256(1 << (255 - i));
        } else {
            b &= ~uint256(1 << (255 - i));
        }
        return b;
    }
    function set(bytes32 memory b, uint256 i) internal returns (bytes32) {
        return setTo(b, i, 1);
    }
    function unset(bytes32 memory b, uint256 i) internal returns (bytes32) {
        return setTo(b, i, 0);
    }
}