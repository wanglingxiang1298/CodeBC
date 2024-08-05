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
    function _remove(bytes32 value) public {
        _bytes32Set.remove(value);
    }
    function _contains(bytes32 value) public view returns (bool) {
        return _bytes32Set.contains(value);
    }
    function _length() public view returns (uint256) {
        return _bytes32Set.length();
    }
    function _at(uint256 index) public view returns (bytes32) {
        return _bytes32Set.at(index);
    }
    function _values() public view returns (bytes32[] memory) {
        return _bytes32Set.values();
    }
    function _addAddress(address addr) public {
        _addressSet.add(addr);
    }
    function _removeAddress(address addr) public {
        _addressSet.remove(addr);
    }
    function _containsAddress(address addr) public view returns (bool) {
        return _addressSet.contains(addr);
    }
    function _lengthAddress() public view returns (uint256) {
        return _addressSet.length();
    }
    function _atAddress(uint256 index) public view returns (address) {
        return _addressSet.at(index);
    }
    function _valuesAddress() public view returns (address[] memory) {
        return _addressSet.values();
    }
    function _addUint(uint256 num) public {
        _uintSet.add(num);
    }
    function _removeUint(uint256 num) public {
        _uintSet.remove(num);
    }
    function _containsUint(uint256 num) public view returns (bool) {
        return _uintSet.contains(num);
    }
    function _lengthUint() public view returns (uint256) {
        return _uintSet.length();
    }
    function _atUint(uint256 index) public view returns (uint256) {
        return _uintSet.at(index);
    }
    function _valuesUint() public view returns (uint256[] memory) {
        return _uintSet.values();
    }
}