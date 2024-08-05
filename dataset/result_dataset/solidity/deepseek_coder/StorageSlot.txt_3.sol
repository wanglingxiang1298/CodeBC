pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) public view returns (address) {
        return address(storage.slotAddresses[slot]);
    }
    function getBooleanSlot(uint256 slot) public view returns (bool) {
        return storage.slotBoolValues[slot];
    }
    function getBytes32Slot(uint256 slot) public view returns (bytes32) {
        return storage.slotBytes32Values[slot];
    }
    function getUint256Slot(uint256 slot) public view returns (uint256) {
        return storage.slotUint256Values[slot];
    }
    function getStringSlot(uint256 slot) public view returns (string) {
        return storage.slotStringValues[slot];
    }
    function getBytesSlot(uint256 slot) public view returns (bytes) {
        return storage.slotBytesValues[slot];
    }
    function getBytesArraySlot(uint256 slot) public view returns (bytes[]) {
        return storage.slotBytesArrayValues[slot];
    }
}