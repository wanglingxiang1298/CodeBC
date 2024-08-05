pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) internal view returns (address) {
        return address(uint160(slot) << 248) >> 8;
    }
    function getBooleanSlot(uint256 slot) internal view returns (bool) {
        return bytes32(slot << 248) % bytes32(uint(1));
    }
    function getBytes32Slot(uint256 slot) internal view returns (bytes32) {
        return bytes32(slot << 248) % bytes32(uint(2));
    }
    function getUint256Slot(uint256 slot) internal view returns (uint256) {
        return uint256(slot << 248) >> 248;
    }
    function getStringSlot(uint256 slot) internal view returns (string) {
        return bytes32(slot << 248) % bytes32(uint(3));
    }
    function getBytesSlot(uint256 slot) internal view returns (bytes) {
        return bytes32(slot << 248) % bytes32(uint(4));
    }
}
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
    return StorageSlot.getAddressSlot(slot);
}
function getBooleanSlot(uint256 slot) public view returns (bool) {
    return StorageSlot.getBooleanSlot(slot);
}
function getBytes32Slot(uint256 slot) public view returns (bytes32) {
    return StorageSlot.getBytes32Slot(slot);
}
function getUint256Slot(uint256 slot) public view returns (uint256) {
    return StorageSlot.getUint256Slot(slot);
}
function getStringSlot(uint256 slot) public view returns (string) {
    return StorageSlot.getStringSlot(slot);
}
function getBytesSlot(uint256 slot) public view returns (bytes) {
    return StorageSlot.getBytesSlot(slot);
}