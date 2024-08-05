pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) internal view returns (address) {
        return address(uint160(slot) << 248) >> 8;
    }
    function getBooleanSlot(uint256 slot) internal view returns (bool) {
        return bytes32(slot << 248) % bytes32(uint(1));
    }
    function getBytes32Slot(uint256 slot) internal view returns (bytes32) {
        return bytes32(slot << 248) % bytes32(uint(1));
    }
    function getUint256Slot(uint256 slot) internal view returns (uint256) {
        return uint256(slot << 248) % uint256(uint(1));
    }
    function getStringSlot(uint256 slot) internal view returns (string) {
        return bytes32(slot << 248) % bytes32(uint(1));
    }
    function getBytesSlot(uint256 slot) internal view returns (bytes) {
        return bytes32(slot << 248) % bytes32(uint(1));
    }
}
contract Storage {
    uint256 public slots;
    uint256 public addressSlots;
    uint256 public booleanSlots;
    uint256 public bytes32Slots;
    uint256 public stringSlots;
    uint256 public bytesSlots;
    function Storage() {
        slots = 0;
        addressSlots = 0;
        booleanSlots = 0;
        bytes32Slots = 0;
        stringSlots = 0;
        bytesSlots = 0;
    }
    function setAddressSlot(uint256 slot, address value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getAddressSlot(addressSlots)) << 248);
        structData.copy(StorageSlot.getAddressSlot(addressSlots));
        require(value == StorageSlot.getAddressSlot(addressSlots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function setBooleanSlot(uint256 slot, bool value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getBooleanSlot(booleanSlots)) << 248);
        structData.copy(StorageSlot.getBooleanSlot(booleanSlots));
        require(value == StorageSlot.getBooleanSlot(booleanSlots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function setBytes32Slot(uint256 slot, bytes32 value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getBytes32Slot(bytes32Slots)) << 248);
        structData.copy(StorageSlot.getBytes32Slot(bytes32Slots));
        require(value == StorageSlot.getBytes32Slot(bytes32Slots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function setUint256Slot(uint256 slot, uint256 value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getUint256Slot(uint256Slots)) << 248);
        structData.copy(StorageSlot.getUint256Slot(uint256Slots));
        require(value == StorageSlot.getUint256Slot(uint256Slots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function setStringSlot(uint256 slot, string value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getStringSlot(stringSlots)) << 248);
        structData.copy(StorageSlot.getStringSlot(stringSlots));
        require(value == StorageSlot.getStringSlot(stringSlots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function setBytesSlot(uint256 slot, bytes value) external {
        bytes32 memory data = new bytes32(uint(slot) << 248);
        data.copy(uint256(slot << 248) >> 8);
        bytes32 memory structData = new bytes32(uint(StorageSlot.getBytesSlot(bytesSlots)) << 248);
        structData.copy(StorageSlot.getBytesSlot(bytesSlots));
        require(value == StorageSlot.getBytesSlot(bytesSlots), "Invalid value");
        storage.slot[slots] = structData;
    }
    function getAddressSlot(uint256 slot) internal view returns (address) {
        bytes32 memory structData = storage.slot[slot];
        return StorageSlot.getAddressSlot(structData);
    }
    function getBooleanSlot(uint256 slot) internal view returns (bool) {
        bytes32 memory structData = storage.slot[slot];
        return StorageSlot.getBooleanSlot(structData);
    }
    function getBytes32Slot(uint256 slot) internal view returns (bytes32) {
        bytes32 memory structData = storage.slot[slot];
        return StorageSlot.getBytes32Slot(structData);
    }
    function getUint256Slot(uint256 slot) internal view returns (uint256) {