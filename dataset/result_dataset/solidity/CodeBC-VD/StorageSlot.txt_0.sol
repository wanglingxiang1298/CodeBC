pragma solidity ^0.8.20;
library StorageSlot {
    struct AddressSlot {
        bytes32 slot;
    }
    struct BooleanSlot {
        bytes32 slot;
    }
    struct Bytes32Slot {
        bytes32 slot;
    }
    struct Uint256Slot {
        bytes32 slot;
    }
    struct StringSlot {
        bytes32 slot;
    }
    struct BytesSlot {
        bytes32 slot;
    }
    function getAddressSlot(AddressSlot storage self) internal view returns (address) {
        return abi.decode(self.slot, (address));
    }
    function getBooleanSlot(BooleanSlot storage self) internal view returns (bool) {
        return abi.decode(self.slot, (bool));
    }
    function getBytes32Slot(Bytes32Slot storage self) internal view returns (bytes32) {
        return abi.decode(self.slot, (bytes32));
    }
    function getUint256Slot(Uint256Slot storage self) internal view returns (uint256) {
        return abi.decode(self.slot, (uint256));
    }
    function getStringSlot(StringSlot storage self) internal view returns (string memory) {
        return abi.decode(self.slot, (string));
    }
    function getBytesSlot(BytesSlot storage self) internal view returns (bytes memory) {
        return abi.decode(self.slot, (bytes));
    }
}