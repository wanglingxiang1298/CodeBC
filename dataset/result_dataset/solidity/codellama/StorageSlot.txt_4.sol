pragma solidity ^0.8.20;

import "StorageSlot.sol";

contract MyContract {
    using StorageSlot for *;

    address private _addressSlot;
    bool private _booleanSlot;
    bytes32 private _bytes32Slot;
    uint256 private _uint256Slot;
    string private _stringSlot;
    bytes private _bytesSlot;

    function getAddressSlot() public view returns (address) {
        return _addressSlot.get();
    }

    function getBooleanSlot() public view returns (bool) {
        return _booleanSlot.get();
    }

    function getBytes32Slot() public view returns (bytes32) {
        return _bytes32Slot.get();
    }

    function getUint256Slot() public view returns (uint256) {
        return _uint256Slot.get();
    }

    function getStringSlot() public view returns (string) {
        return _stringSlot.get();
    }

    function getBytesSlot() public view returns (bytes) {
        return _bytesSlot.get();
    }
}