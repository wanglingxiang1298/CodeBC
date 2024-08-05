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
        return string(_stringSlot[slot]);
    }
    function getBytesSlot(bytes32 slot) public view returns (bytes memory) {
        return _bytesSlot[slot];
    }
    function setAddressSlot(bytes32 slot, address addr) public {
        _addressSlot[slot] = addr;
    }
    function setBooleanSlot(bytes32 slot, bool val) public {
        _booleanSlot[slot] = val;
    }
    function setBytes32Slot(bytes32 slot, bytes32 val) public {
        _bytes32Slot[slot] = val;
    }
    function setUint256Slot(bytes32 slot, uint256 val) public {
        _uint256Slot[slot] = val;
    }
    function setStringSlot(bytes32 slot, string memory val) public {
        _stringSlot[slot] = val;
    }
    function setBytesSlot(bytes32 slot, bytes memory val) public {
        _bytesSlot[slot] = val;
    }
}