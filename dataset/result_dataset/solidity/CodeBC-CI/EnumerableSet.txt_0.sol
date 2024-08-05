pragma solidity ^0.8.20;
contract EnumerableSetExample {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using EnumerableSet for EnumerableSet.AddressSet;
    using EnumerableSet for EnumerableSet.UintSet;
    EnumerableSet.Bytes32Set _bytes32Set;
    EnumerableSet.AddressSet _addressSet;
    EnumerableSet.UintSet _uintSet;
    constructor() {
    }
    function _add(bytes32 value) public {
        _bytes32Set.add(value);
    }
    function _add(address value) public {
        _addressSet.add(value);
    }
    function _add(uint value) public {
        _uintSet.add(uint(value));
    }
    function _remove(bytes32 value) public {
        _bytes32Set.remove(value);
    }
    function _remove(address value) public {
        _addressSet.remove(value);
    }
    function _remove(uint value) public {
        _uintSet.remove(uint(value));
    }
    function _contains(bytes32 value) public view returns (bool) {
        return _bytes32Set.contains(value);
    }
    function _contains(address value) public view returns (bool) {
        return _addressSet.contains(value);
    }
    function _contains(uint value) public view returns (bool) {
        return _uintSet.contains(uint(value));
    }
    function _length() public view returns (uint) {
        return _bytes32Set.length();
    }
    function _length() public view returns (uint) {
        return _addressSet.length();
    }
    function _length() public view returns (uint) {
        return _uintSet.length();
    }
    function _at(uint index) public view returns (bytes32) {
        return _bytes32Set.at(index);
    }
    function _at(uint index) public view returns (address) {
        return _addressSet.at(index);
    }
    function _at(uint index) public view returns (uint) {
        return uint(_uintSet.at(index));
    }
    function _values() public view returns (bytes32[] memory) {
        return _bytes32Set.values();
    }
    function _values() public view returns (address[] memory) {
        return _addressSet.values();
    }
    function _values() public view returns (uint[] memory) {
        return uintArray(_uintSet.values());
    }
    function uintArray(uint[] memory arr) nction _contains(uint value) public view returns (bool) {
        return _uintSet.contains(uint(value));
    }
    function _length() public view returns (uint) {
        return _bytes32Set.length();
    }
    function _length() public view returns (uint) {
        return _addressSet.length();
    }
    function _length() public view returns (uint) {
        return _uintSet.length();
    }
    function _at(uint index) public view returns (bytes32) {
        return _bytes32Set.at(index);
    }
    function _at(uint index) public view returns (address) {
        return _addressSet.at(index);
    }
    function _at(uint index) public view returns (uint) {
        return uint(_uintSet.at(index));
    }
    function _values() public view returns (bytes32[] memory) {
        return _bytes32Set.values();
    }
    function _values() public view returns (address[] memory) {
        return _addressSet.values();
    }
    function _values() public view returns (uint[] memory) {
        return uintArray(_uintSet.values());
    }
    function uintArray(uint[] memory arr) public pure returns (uint[] memory) {
        uint[] memory ans = new uint[](arr.length);
        for (uint i = 0; i < arr.length; i++) {
            ans[i] = uint(arr[i]);
        }
        return ans;
    }
}
