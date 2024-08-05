pragma solidity ^0.8.20;
library EnumerableSetBytes32 {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    EnumerableSet.Bytes32Set private _bytes32Set;
    function _add(bytes32 value) private {
        _bytes32Set.add(value);
    }
    function _remove(bytes32 value) private {
        _bytes32Set.remove(value);
    }
    function _contains(bytes32 value) private view returns (bool) {
        return _bytes32Set.contains(value);
    }
    function _length() private view returns (uint256) {
        return _bytes32Set.length();
    }
    function _at(uint256 index) private view returns (bytes32) {
        return _bytes32Set.at(index);
    }
    function _values() private view returns (bytes32[] memory) {
        return _bytes32Set.values();
    }
}
library EnumerableSetAddress {
    using EnumerableSet for EnumerableSet.AddressSet;
    EnumerableSet.AddressSet private _addressSet;
    function _add(address value) private {
        _addressSet.add(value);
    }
    function _remove(address value) private {
        _addressSet.remove(value);
    }
    function _contains(address value) private view returns (bool) {
        return _addressSet.contains(value);
    }
    function _length() private view returns (uint256) {
        return _addressSet.length();
    }
    function _at(uint256 index) private view returns (address) {
        return _addressSet.at(index);
    }
    function _values() private view returns (address[] memory) {
        return _addressSet.values();
    }
}
library EnumerableSetUint {
    using EnumerableSet for EnumerableSet.UintSet;
    EnumerableSet.UintSet private _uintSet;
    function _add(uint value) private {
        _uintSet.add(value);
    }
    function _remove(uint value) private {
        _uintSet.remove(value);
    }
    function _contains(uint value) private view returns (bool) {
        return _uintSet.contains(value);
    }
    function _length() private view returns (uint256) {
        return _uintSet.length();
    }
    function _at(uint256 index) private view returns (uint) {
        return _uintSet.at(index);
    }
    function _values() private view returns (uint[] memory) {
        return _uintSet.values();
    }
}