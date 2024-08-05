pragma solidity ^0.8.20;
contract SetCollection {
    bytes32Set private bytes32Set;
    addressSet private addressSet;
    uintSet private uintSet;
    function add(uint setType, bytes32 value) public {
        if (setType == 1) {
            bytes32Set.add(value);
        } else if (setType == 2) {
            addressSet.add(value);
        } else if (setType == 3) {
            uintSet.add(value);
        }
    }
    function remove(uint setType, bytes32 value) public {
        if (setType == 1) {
            bytes32Set.remove(value);
        } else if (setType == 2) {
            addressSet.remove(value);
        } else if (setType == 3) {
            uintSet.remove(value);
        }
    }
    function contains(uint setType, bytes32 value) public view returns (bool) {
        if (setType == 1) {
            return bytes32Set.contains(value);
        } else if (setType == 2) {
            return addressSet.contains(value);
        } else if (setType == 3) {
            return uintSet.contains(value);
        }
    }
    function length(uint setType) public view returns (uint) {
        if (setType == 1) {
            return bytes32Set.length();
        } else if (setType == 2) {
            return addressSet.length();
        } else if (setType == 3) {
            return uintSet.length();
        }
    }
    function at(uint setType, uint index) public view returns (bytes32 | address | uint) {
        if (setType == 1) {
            return bytes32Set.at(index);
        } else if (setType == 2) {
            return addressSet.at(index);
        } else if (setType == 3) {
            return uintSet.at(index);
        }
    }
    function values(uint setType) public view returns (bytes32[] memory) {
        if (setType == 1) {
            return bytes32Set.values();
        } else if (setType == 2) {
            return addressSet.values();
        } else if (setType == 3) {
            return uintSet.values();
        }
    }
}