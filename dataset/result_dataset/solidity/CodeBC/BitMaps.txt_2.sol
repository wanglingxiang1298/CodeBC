pragma solidity ^0.8.20;
contract BitMaps {
    uint256 private _bitmap;
    constructor(uint256 bitmap_) {
        _bitmap = bitmap_;
    }
    function get(uint256 index_) public view returns (uint8) {
        uint256 itemPosition = itemPosition_(index_);
        uint256 itemMask = itemMask_(itemPosition);
        return uint8((_bitmap & itemMask) >> itemPosition);
    }
    function setTo(uint256 index_, uint8 value_) public {
        require(value_ <= 1, "BitMaps: value must be 0 or 1");
        uint256 itemPosition = itemPosition_(index_);
        uint256 itemMask = itemMask_(itemPosition);
        if (value_ == 1) {
            _bitmap |= itemMask;
        } else {
            _bitmap &= ~itemMask;
        }
    }
    function set(uint256 index_) public {
        setTo(index_, 1);
    }
    function unset(uint256 index_) public {
        setTo(index_, 0);
    }
    function itemPosition_(uint256 index_) private pure returns (uint256) {
        return index_ % 256;
    }
    function itemMask_(uint256 itemPosition_) private pure returns (uint256) {
        return uint256(1) << itemPosition_;
    }
}

