pragma solidity ^0.8.20;
library EnumerableSet {
    struct Bytes32Set {
        bytes32[] elements;
    }
    struct AddressSet {
        address[] elements;
    }
    struct UintSet {
        uint[] elements;
    }
    bytes32[] private bytes32Set;
    address[] private addressSet;
    uint[] private uintSet;
    function addBytes32(bytes32 value) external pure returns(bool) {
        bytes32Set.push(value);
        return true;
    }
    function addAddress(address value) external pure returns(bool) {
        addressSet.push(value);
        return true;
    }
    function addUint(uint value) external pure returns(bool) {
        uintSet.push(value);
        return true;
    }
    function removeBytes32(bytes32 value) external pure returns(bool) {
        bytes32Set.pop(bytes32Set.indexOf(value));
        return true;
    }
    function removeAddress(address value) external pure returns(bool) {
        addressSet.pop(addressSet.indexOf(value));
        return true;
    }
    function removeUint(uint value) external pure returns(bool) {
        uintSet.pop(uintSet.indexOf(value));
        return true;
    }
    function containsBytes32(bytes32 value) external pure returns(bool) {
        return bytes32Set.includes(value);
    }
    function containsAddress(address value) external pure returns(bool) {
        return addressSet.includes(value);
    }
    function containsUint(uint value) external pure returns(bool) {
        return uintSet.includes(value);
    }
    function length() external pure returns(uint) {
        return bytes32Set.length;
    }
    function at(uint index) external pure returns(bytes32, address, uint) {
        return (bytes32Set[index], addressSet[index], uintSet[index]);
    }
    function values() external pure returns(bytes32[], address[], uint[]) {
        return (bytes32Set, addressSet, uintSet);
    }
}