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
        return address(slot);
    }

    function getBooleanSlot(uint256 slot) public view returns (bool) {
        return bool(slot);
    }

    function getBytes32Slot(uint256 slot) public view returns (bytes32) {
        return bytes32(slot);
    }

    function getUint256Slot(uint256 slot) public view returns (uint256) {
        return uint256(slot);
    }

    function getStringSlot(uint256 slot) public view returns (string memory) {
        return string(slot);
    }

    function getBytesSlot(uint256 slot) public view returns (bytes memory) {
        return bytes(slot);
    }
}