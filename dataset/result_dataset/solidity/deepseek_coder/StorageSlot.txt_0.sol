pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) public view returns (address) {
        return address(storage.slotMap[slot]);
    }
    function getBooleanSlot(uint256 slot) public view returns (bool) {
        return storage.slotMap[slot];
    }
    function getBytes32Slot(uint256 slot) public view returns (bytes32) {
        return storage.slotMap[slot];
    }
    function getUint256Slot(uint256 slot) public view returns (uint256) {
        return storage.slotMap[slot];
    }
    function getStringSlot(uint256 slot) public view returns (string) {
        return storage.slotMap[slot];
    }
    function getBytesSlot(uint256 slot) public view returns (bytes) {
        return storage.slotMap[slot];
    }
    function getBytesSlot(uint256 slot) public view returns (bytes[]) {
        return storage.slotMap[slot];
    }
}