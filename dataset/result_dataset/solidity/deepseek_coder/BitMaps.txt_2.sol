pragma solidity ^0.8.20;
import "BitMaps/BitMaps.sol";
contract SmartContract {
    uint256 public constant MAX_VALUE = MAX_UINT256;
    uint256 public constant MIN_VALUE = 0;
    uint256 public constant MAX_VALUE_IN_BITS = 256;
    uint256 public constant MIN_VALUE_IN_BITS = 0;
    uint256 public constant MAX_LENGTH = MAX_VALUE_IN_BITS;
    uint256 public constant MIN_LENGTH = MIN_VALUE_IN_BITS;
    BitMaps.BitMap public bitMap;
    constructor(uint256[] memory bitMapValues) {
        bitMap = new BitMaps.BitMap(bitMapValues);
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
        bitMap.unset(index);
    }
    function getLength() public view returns (uint256) {
        return bitMap.getLength();
    }
    function getValue(uint256 index) public view returns (uint256) {
        return bitMap.getValue(index);
    }
    function getValues(uint256 startIndex, uint256 length) public view returns (bool[]) {
        return bitMap.getValues(startIndex, length);
    }
    function getAll() public view returns (bool[]) {
        return bitMap.getAll();
    }
    function isSet(uint256[] memory indices) public view returns (bool) {
        return bitMap.isSet(indices);
    }
    function countSetBits(uint256 value) private view returns (uint256) {
        return bitMap.countSetBits(value);
    }
    function countSetBitsRange(uint256 fromValue, uint256 toValue) private view returns (uint256) {
        return bitMap.countSetBitsRange(fromValue, toValue);
    }
    function countSetBitsAll() private view returns (uint256) {
        return bitMap.countSetBitsAll();
    }
    function count