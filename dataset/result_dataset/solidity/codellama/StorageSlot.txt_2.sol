pragma solidity ^0.8.20;

library StorageSlot {
    struct AddressSlot {
        address value;
    }

    struct BooleanSlot {
        bool value;
    }

    struct Bytes32Slot {
        bytes32 value;
    }

    struct Uint256Slot {
        uint256 value;
    }

    struct StringSlot {
        string value;
    }

    struct BytesSlot {
        bytes value;
    }

    function getAddressSlot(uint256 slot) public view returns (address) {
        return StorageSlot.AddressSlot(slot).value;
    }

    function getBooleanSlot(uint256 slot) public view returns (bool) {
        return StorageSlot.BooleanSlot(slot).value;
    }

    function getBytes32Slot(uint256 slot) public view returns (bytes32) {
        return StorageSlot.Bytes32Slot(slot).value;
    }

    function getUint256Slot(uint256 slot) public view returns (uint256) {
        return StorageSlot.Uint256Slot(slot).value;
    }

    function getStringSlot(uint256 slot) public view returns (string) {
        return StorageSlot.StringSlot(slot).value;
    }

    function getBytesSlot(uint256 slot) public view returns (bytes) {
        return StorageSlot.BytesSlot(slot).value;
    }
}