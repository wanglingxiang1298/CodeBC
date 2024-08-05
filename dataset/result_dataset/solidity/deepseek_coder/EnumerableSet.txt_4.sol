pragma solidity ^0.8.20;
library EnumerableSet {
    bytes32[] private _bytes32Set;
    address[] private _addressSet;
    uint256[] private _uint256Set;
    function addBytes32(bytes32 value) public {
        _bytes32Set.push(value);
    }
    function removeBytes32(bytes32 value) public {
        for (uint256 i = 0; i < _bytes32Set.length; i++) {
            if (_bytes32Set[i] == value) {
                _bytes32Set.delete(i);
                break;
            }
        }
    }
    function containsBytes32(bytes32 value) public view returns (bool) {
        for (uint256 i = 0; i < _bytes32Set.length; i++) {
            if (_bytes32Set[i] == value) {
                return true;
            }
        }
        return false;
    }
    function lengthBytes32() public view returns (uint256) {
        return _bytes32Set.length;
    }
    function addAddress(address value) public {
        _addressSet.push(value);
    }
    function removeAddress(address value) public {
        for (uint256 i = 0; i < _addressSet.length; i++) {
            if (_addressSet[i] == value) {
                _addressSet.delete(i);
                break;
            }
        }
    }
    function containsAddress(address value) public view returns (bool) {
        for (uint256 i = 0; i < _addressSet.length; i++) {
            if (_addressSet[i] == value) {
                return true;
            }
        }
        return false;
    }
    function lengthAddress() public view returns (uint256) {
        return _addressSet.length;
    }
    function addUint256(uint256 value) public {
        _uint256Set.push(value);
    }
    function removeUint256(uint256 value) public {
        for (uint256 i = 0; i < _uint256Set.length; i++) {
            if (_uint256Set[i] == value) {
                _uint256Set.delete(i);
                break;
            }
        }
    }
    function containsUint256(uint256 value) public view returns (bool) {
        for (uint256 i = 0; i < _uint256Set.length; i++) {
            if (_uint256Set[i] == value) {
                return true;
            }
        }
        return false;
    }
    function lengthUint256() public view returns (uint256) {
        return _uint256Set.length;
    }
    function atBytes32(uint256 index) public view returns (bytes32) {
        return _bytes32Set[index];
    }
    function valuesBytes32() public view returns (bytes32[] memory) {
        return _bytes32Set;
    }
    function atAddress(uint256 index) public view returns (address) {
        return _addressSet[index];
    }
    function valuesAddress() public view returns (address[] memory) {
        return _addressSet;
    }
    function atUint256(uint256 index) public view returns (uint256) {
        return _uint256Set[index];
    }
    function valuesUint256() public view returns (uint256[] memory) {
        return _uint256Set;
    }
}