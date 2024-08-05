pragma solidity ^ 0.8.20;
library BitMaps {
    struct BitMap {
        uint256[] data;
        uint256 mask;
    }
    function get(uint256 index) public view returns (bool) {
        index &= ~mask;
        return (data[index >> 22] >> (index % (1 << 22))) & 1;
    }
    function setTo(uint256 index, bool value) public {
        index |= (value ? 1 : 0) << (index % (1 << 22));
        data[index >> 22] &= ~(1 << (index % (1 << 22)));
        data[index >> 22] |= value << (index % (1 << 22));
    }
    function set(uint256 index) public {
        setTo(index, true);
    }
    function unset(uint256 index) public {
        setTo(index, false);
    }
}