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
    function getAddressSlot(bytes32 slot)
        internal
        pure
        returns (AddressSlot memory)
    {
        return AddressSlot({value: abi.decode(
            storageSlot(slot),
            (address)
        )});
    }
    function getBooleanSlot(bytes32 slot)
        internal
        pure
        returns (BooleanSlot memory)
    {
        return BooleanSlot({value: abi.decode(
            storageSlot(slot),
            (bool)
        )});
    }
    function getBytes32Slot(bytes32 slot)
        internal
        pure
        returns (Bytes32Slot memory)
    {
        return Bytes32Slot({value: abi.decode(
            storageSlot(slot),
            (bytes32)
        )});
    }
    function getUint256Slot(bytes32 slot)
        internal
        pure
        returns (Uint256Slot memory)
    {
        return Uint256Slot({value: abi.decode(
            storageSlot(slot),
            (uint256)
        )});
    }
    function getStringSlot(bytes32 slot)
        internal
        pure
        returns (StringSlot memory)
    {
        return StringSlot({value: abi.decode(
            storageSlot(slot),
            (string)
        )});
    }
    function getBytesSlot(bytes32 slot)
        internal
        pure
        returns (BytesSlot memory)
    {
        return BytesSlot({value: abi.decode(
            storageSlot(slot),
            (bytes)
        )});
    }
    function storageSlot(bytes32 slot)
        internal
        pure
        returns (bytes storage)
    {
        assembly {
            slot := add(slot, 0x20)
            let ptr := mload(0x40)
            mstore(0x40, add(ptr, 0x40))
            ptr := add(ptr, slot)
            mstore(ptr, 0x0)
            slot := add(slot, 0x20)
            ptr := add(ptr, 0x20)
            mstore(ptr, 0x0)
            slot := add(slot, 0x20)
            mstore(slot, 0x0)
            slot := add(slot, 0x20)
        }
    }
}