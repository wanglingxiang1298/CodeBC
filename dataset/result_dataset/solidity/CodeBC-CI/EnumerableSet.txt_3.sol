pragma solidity ^0.8.20;
contract EnumerableSetExample {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    EnumerableSet.Bytes32Set private bytes32Set;
    using EnumerableSet for EnumerableSet.AddressSet;
    EnumerableSet.AddressSet private addressSet;
    using EnumerableSet for EnumerableSet.UintSet;
    EnumerableSet.UintSet private uintSet;
    constructor() {
    }
    function _add(bytes32 value) public {
        bytes32Set.add(value);
    }
    function _remove(bytes32 value) public {
        bytes32Set.remove(value);
    }
    function _contains(bytes32 value) public view returns (bool) {
        return bytes32Set.contains(value);
    }
    function _length() public view returns (uint256) {
        return bytes32Set.length();
    }
    function _at(uint256 index) public view returns (bytes32) {
        return bytes32Set.at(index);
    }
    function _values() public view returns (bytes32[] memory) {
        return bytes32Set.values();
    }
    function addAddress(address addr) public {
        addressSet.add(addr);
    }
    function removeAddress(address addr) public {
        addressSet.remove(addr);
    }
    function containsAddress(address addr) public view returns (bool) {
        return addressSet.contains(addr);
    }
    function lengthAddress() public view returns (uint256) {
        return addressSet.length();
    }
    function atAddress(uint256 index) public view returns (address) {
        return addressSet.at(index);
    }
    function valuesAddress() public view returns (address[] memory) {
        return addressSet.values();
    }
    function addUint(uint256 num) public {
        uintSet.add(num);
    }
    function removeUint(uint256 num) public {
        uintSet.remove(num);
    }
    function containsUint(uint256 num) public view returns (bool) {
        return uintSet.contains(num);
    }
    function lengthUint() public view returns (uint256) {
        return uintSet.length();
    }
    function atUint(uint256 index) public view returns (uint256) {
        return uintSet.at(index);
    }
    function valuesUint() public view returns (uint256[] memory) {
        return uintSet.values();
    }
}