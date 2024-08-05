pragma solidity ^0.8.20;
library EnumerableSetBytes32 {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    EnumerableSet.Bytes32Set private _set;
    function _add(bytes32 value) internal {
        _set.add(value);
    }
    function _remove(bytes32 value) internal {
        _set.remove(value);
    }
    function _contains(bytes32 value) internal view returns (bool) {
        return _set.contains(value);
    }
    function _length() internal view returns (uint) {
        return _set.length();
    }
    function _at(uint index) internal view returns (bytes32) {
        return _set.at(index);
    }
    function _values() internal view returns (bytes32[] memory) {
        return _set.values();
    }
}