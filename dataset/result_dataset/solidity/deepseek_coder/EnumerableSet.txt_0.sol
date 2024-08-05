pragma solidity ^0.8.20;
library EnumerableSet {
    function addBytes32(bytes32[] memory set, bytes32 element) internal returns (bytes32[] memory newSet) {
        newSet = set;
        if (containsBytes32(set, element)) {
            return newSet;
        }
        newSet.push(element);
        return newSet;
    }
    function removeBytes32(bytes32[] memory set, bytes32 element) internal returns (bytes32[] memory newSet) {
        newSet = set;
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                newSet.splice(i, 1);
                return newSet;
            }
        }
        return newSet;
    }
    function containsBytes32(bytes32[] memory set, bytes32 element) internal view returns (bool) {
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                return true;
            }
        }
        return false;
    }
    function lengthBytes32(bytes32[] memory set) internal view returns (uint) {
        return set.length;
    }
    function addAddress(address[] memory set, address element) internal returns (address[] memory newSet) {
        newSet = set;
        if (containsAddress(set, element)) {
            return newSet;
        }
        newSet.push(element);
        return newSet;
    }
    function removeAddress(address[] memory set, address element) internal returns (address[] memory newSet) {
        newSet = set;
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                newSet.splice(i, 1);
                return newSet;
            }
        }
        return newSet;
    }
    function containsAddress(address[] memory set, address element) internal view returns (bool) {
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                return true;
            }
        }
        return false;
    }
    function addUint(uint[] memory set, uint element) internal returns (uint[] memory newSet) {
        newSet = set;
        if (containsUint(set, element)) {
            return newSet;
        }
        newSet.push(element);
        return newSet;
    }
    function removeUint(uint[] memory set, uint element) internal returns (uint[] memory newSet) {
        newSet = set;
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                newSet.splice(i, 1);
                return newSet;
            }
        }
        return newSet;
    }
    function containsUint(uint[] memory set, uint element) internal view returns (bool) {
        for (uint i = 0; i < set.length; i++) {
            if (set[i] == element) {
                return true;
            }
        }
        return false;
    }
    function getValues(bytes32[] memory set) internal view returns (bytes32[] memory) {
        return set;
    }
}