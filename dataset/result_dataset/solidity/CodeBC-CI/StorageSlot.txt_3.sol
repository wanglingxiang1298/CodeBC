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
    function getAddressSlot(uint256 _slot) public view returns (AddressSlot memory) {
        return AddressSlot({ value: addressStorage[_slot] });
    }
    function getBooleanSlot(uint256 _slot) public view returns (BooleanSlot memory) {
        return BooleanSlot({ value: boolStorage[_slot] });
    }
    function getBytes32Slot(uint256 _slot) public view returns (Bytes32Slot memory) {
        return Bytes32Slot({ value: bytes32Storage[_slot] });
    }
    function getUint256Slot(uint256 _slot) public view returns (Uint256Slot memory) {
        return Uint256Slot({ value: uint256Storage[_slot] });
    }
    function getStringSlot(uint256 _slot) public view returns (StringSlot memory) {
        return StringSlot({ value: stringStorage[_slot] });
    }
    function getBytesSlot(uint256 _slot) public view returns (BytesSlot memory) {
        return BytesSlot({ value: bytesStorage[_slot] });
    }
}