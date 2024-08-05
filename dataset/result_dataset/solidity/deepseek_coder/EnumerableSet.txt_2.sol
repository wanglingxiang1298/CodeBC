pragma solidity ^0.8.20;
contract Set {
    set bytes32[] private bytes32Set;
    function addBytes32(bytes32 value) public {
        bytes32[] memory temp = bytes32Set;
        temp.push(value);
        bytes32Set = temp;
    }
    function removeBytes32(bytes32 value) public {
        bytes32[] memory temp = bytes32Set;
        temp.remove(temp.indexOf(value));
        bytes32Set = temp;
    }
    function containsBytes32(bytes32 value) public view returns (bool) {
        return bytes32Set.contains(value);
    }
    function lengthBytes32() public view returns (uint256) {
        return bytes32Set.length;
    }
    function atBytes32(uint256 index) public view returns (bytes32) {
        return bytes32Set[index];
    }
    function valuesBytes32() public view returns (bytes32[] memory) {
        return bytes32Set;
    }
    set address[] private addressSet;
    function addAddress(address value) public {
        address[] memory temp = addressSet;
        temp.push(value);
        addressSet = temp;
    }
    function removeAddress(address value) public {
        address[] memory temp = addressSet;
        temp.remove(temp.indexOf(value));
        addressSet = temp;
    }
    function containsAddress(address value) public view returns (bool) {
        return addressSet.contains(value);
    }
    function lengthAddress() public view returns (uint256) {
        return addressSet.length;
    }
    function atAddress(uint256 index) public view returns (address) {
        return addressSet[index];
    }
    function valuesAddress() public view returns (address[] memory) {
        return addressSet;
    }
    set uint256[] private uintSet;
    function addUint(uint256 value) public {
        uint256[] memory temp = uintSet;
        temp.push(value);
        uintSet = temp;
    }
    function removeUint(uint256 value) public {
        uint256[] memory temp = uintSet;
        temp.remove(temp.indexOf(value));
        uintSet = temp;
    }
    function containsUint(uint256 value) public view returns (bool) {
        return uintSet.contains(value);
    }
    function lengthUint() public view returns (uint256) {
        return uintSet.length;
    }
    function atUint(uint256 index) public view returns (uint256) {
        return uintSet[index];
    }
    function valuesUint() public view returns (uint256[] memory) {
        return uintSet;
    }
}