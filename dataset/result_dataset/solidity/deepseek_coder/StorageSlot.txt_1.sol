pragma solidity ^0.8.20;
library StorageSlot {
    struct Slot {
        uint256 slotId;
        bytes32 slotType;
        bytes32[] storage slots;
    }
    function getSlotId(uint256 _slotId) private view returns (Slot memory) {
        Slot memory _slot = new Slot();
        _slot.slotId = _slotId;
        _slot.slotType = "";
        _slot.slots.length = 0;
        return _slot;
    }
    function getSlotType(uint256 _slotId) private view returns (bytes32) {
        Slot memory _slot = getSlotId(_slotId);
        return _slot.slotType;
    }
    function getSlotValue(uint256 _slotId) private view returns (bytes32[] memory) {
        Slot memory _slot = getSlotId(_slotId);
        return _slot.slots;
    }
    function setSlotValue(uint256 _slotId, bytes32[] memory _value) private mutable returns (bool) {
        Slot memory _slot = getSlotId(_slotId);
        _slot.slots = _value;
        return true;
    }
}