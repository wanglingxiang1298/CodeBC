pragma solidity ^0.8.20;
contract SetCollection {
    bytes32Set private bytes32Set;
    addressSet private addressSet;
    uintSet private uintSet;
    function add(uint setType, bytes32 value) public {
        switch (setType) {
            case 1:
                bytes32Set.add(value);
                break;
            case 2:
                addressSet.add(value);
                break;
            case 3:
                uintSet.add(value);
                break;
            default:
                revert("Invalid set type");
        }
    }
    function remove(uint setType, bytes32 value) public {
        switch (setType) {
            case 1:
                bytes32Set.remove(value);
                break;
            case 2:
                addressSet.remove(value);
                break;
            case 3:
                uintSet.remove(value);
                break;
            default:
                revert("Invalid set type");
        }
    }
    function contains(uint setType, bytes32 value) public view returns (bool) {
        switch (setType) {
            case 1:
                return bytes32Set.contains(value);
                break;
            case 2:
                return addressSet.contains(value);
                break;
            case 3:
                return uintSet.contains(value);
                break;
            default:
                revert("Invalid set type");
        }
    }
    function length(uint setType) public view returns (uint) {
        switch (setType) {
            case 1:
                return bytes32Set.length();
                break;
            case 2:
                return addressSet.length();
                break;
            case 3:
                return uintSet.length();
                break;
            default:
                revert("Invalid set type");
        }
    }
    function at(uint setType, uint index) public view returns (bytes32 | address | uint) {
        switch (setType) {
            case 1:
                return bytes32Set.at(index);
                break;
            case 2:
                return addressSet.at(index);
                break;
            case 3:
                return uintSet.at(index);
                break;
            default:
                revert("Invalid set type");
        }
    }
    function values(uint setType) public view returns (bytes32[] memory | address[] memory | uint[] memory) {
        switch (setType) {
            case 1:
                return bytes32Set.values();
                break;
            case 2:
                return addressSet.values();
                break;
            case 3:
                return uintSet.values();
                break;
            default:
                revert("Invalid set type");
        }
    }
}