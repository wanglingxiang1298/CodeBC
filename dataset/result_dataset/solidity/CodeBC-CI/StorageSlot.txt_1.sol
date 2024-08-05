pragma solidity ^0.8.20;
contract StorageSlot {
    mapping(bytes32 => address) private _addressSlot;
    mapping(bytes32 => bool) private _booleanSlot;
    mapping(bytes32 => bytes32) private _bytes32Slot;
    mapping(bytes32 => uint256) private _uint256Slot;
    mapping(bytes32 => string) private _stringSlot;
    mapping(bytes32 => bytes) private _bytesSlot;
    function getAddressSlot(bytes32 slot) public view returns (address) {
        return _addressSlot[slot];
    }
    function getBooleanSlot(bytes32 slot) public view returns (bool) {
        return _booleanSlot[slot];
    }
    function getBytes32Slot(bytes32 slot) public view returns (bytes32) {
        return _bytes32Slot[slot];
    }
    function getUint256Slot(bytes32 slot) public view returns (uint256) {
        return _uint256Slot[slot];
    }
    function getStringSlot(bytes32 slot) public view returns (string memory) {
        return stringlot[slot] = value;
    }
    function setBooleanSlot(bytes32 slot, bool value) public {
        _booleanSlot[slot] = value;
    }
    function setBytes32Slot(bytes32 slot, bytes32 value) public {
        _bytes32Slot[slot] = value;
    }
    function setUint256Slot(bytes32 slot, uint256 value) public {
        _uint256Slot[slot] = value;
    }
    function setStringSlot(bytes32 slot, string memory value) public {
        _stringSlot[slot] = value;
    }
    function setBytesSlot(bytes32 slot, bytes memory value) public {
        _bytesSlot[slot] = value;
    }
}
