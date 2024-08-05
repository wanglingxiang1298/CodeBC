pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) internal view returns (address) {
        return AddressSlot.slotMap(slot);
    }
    function getBooleanSlot(uint256 slot) internal view returns (bool) {
        return BooleanSlot.slotMap(slot);
    }
    function getBytes32Slot(uint256 slot) internal view returns (bytes32) {
        return Bytes32Slot.slotMap(slot);
    }
    function getUint256Slot(uint256 slot) internal view returns (uint256) {
        return Uint256Slot.slotMap(slot);
    }
    function getStringSlot(uint256 slot) internal view returns (string) {
        return StringSlot.slotMap(slot);
    }
    function getBytesSlot(uint256 slot) internal view returns (bytes) {
        return BytesSlot.slotMap(slot);
    }
    function getBytesSlot(bytes32 slot) internal view returns (bytes) {
        return BytesSlot.slotMap(slot);
    }
}
contract SlotStorage {
    struct AddressSlot {
        uint256[] slotMap;
    }
    struct BooleanSlot {
        uint256[] slotMap;
    }
    struct Bytes32Slot {
        uint256[] slotMap;
    }
    struct Uint256Slot {
        uint256[] slotMap;
    }
    struct StringSlot {
        uint256[] slotMap;
    }
    struct BytesSlot {
        uint256[] slotMap;
    }
    function setAddressSlot(uint256 slot, address value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap, value, 32);
        AddressSlot.slotMap(slot) = memorySlot.slotMap;
    }
    function setBooleanSlot(uint256 slot, bool value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap, value ? 1 : 0, 32);
        BooleanSlot.slotMap(slot) = memorySlot.slotMap;
    }
    function setBytes32Slot(uint256 slot, bytes32 value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap[slot], value, 32);
        Bytes32Slot.slotMap(slot) = memorySlot.slotMap[slot];
    }
    function setUint256Slot(uint256 slot, uint256 value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap[slot], value, 32);
        Uint256Slot.slotMap(slot) = memorySlot.slotMap[slot];
    }
    function setStringSlot(uint256 slot, string value) external storageDifferences storage {
        StringSlot.slotMap(slot) = memorySlot.slotMap[slot];
    }
    function setBytesSlot(uint256 slot, bytes value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap[slot], value, value.length);
        BytesSlot.slotMap(slot) = memorySlot.slotMap[slot];
    }
    function setBytesSlot(bytes32 slot, bytes value) external storageDifferences storage {
        memory.copy(memorySlot.slotMap[slot], value, value.length);
        BytesSlot.slotMap(slot) = memorySlot.slotMap[slot];
    }
}