pragma solidity ^0.8.20;
import "BitMaps/BitMaps.sol";
contract SmartContract {
    uint256 public constant MAX_VALUE = 1;
    BitMaps.BitMap public bitMap;
    constructor() {
        bitMap = BitMaps.BitMap(MAX_INDEX, MAX_VALUE);
    }
    function get(uint256 index) public view returns (bool) {
        return bitMap.get(index);
    }
    function setTo(uint256 index, bool value) public {
        bitMap.set(index, value);
    }
    function set(uint256 index) public {
        bitMap.set(index, true);
    }
    function unset(uint256 index) public {
        bitMap.set(index, false);
    }
}