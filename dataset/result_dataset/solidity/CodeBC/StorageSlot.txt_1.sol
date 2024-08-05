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
    function getAddressSlot(AddressSlot storage slot) internal view returns (address) {
        return abi.decode(slot.slot, (address));
    }
    function getBooleanSlot(BooleanSlot storage slot) internal view returns (bool) {
        return abi.decode(slot.slot, (bool));
    }
    function getBytes32Slot(Bytes32Slot storage slot) internal view returns (bytes32) {
        return abi.decode(slot.slot, (bytes32));
    }
    function getUint256Slot(Uint256Slot storage slot) internal view returns (uint256) {
        return abi.decode(slot.slot, (uint256));
    }
    function getStringSlot(StringSlot storage slot) internal view returns (string memory) {
        return abi.decode(slot.slot, (string));
    }
    function getBytesSlot(BytesSlot storage slot) internal view returns (bytes memory) {
        return abi.decode(slot.slot, (bytes));
    }
    function setAddressSlot(AddressSlot storage slot, address value) internal {
        slot.slot = bytes32(uint256(abi.encode(value)));
    }
    function setBooleanSlot(BooleanSlot storage slot, bool value) internal {
        slot.slot = bytes32(uint256(abi.encode(value)));
    }
    function setBytes32Slot(Bytes32Slot storage slot, bytes32 value) internal {
        slot.slot = bytes32(uint256(abi.encode(value)));
    }
    function setUint256Slot(Uint256Slot storage slot, uint256 value) internal {
        slot.slot = bytes32(value);
    }
    function setStringSlot(StringSlot storage slot, string memory value) internal {
        slot.slot = bytes32(uint256(abi.encode(value)));
    }
    function setBytesSlot(BytesSlot storage slot, bytes memory value) internal {
        slot.slot = bytes32(uint256(abi.encode(value)));
    }
}
