pragma solidity ^0.8.20;
contract StorageSlot {
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
    function getAddressSlot(bytes32 slot_) public view returns (address value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getBooleanSlot(bytes32 slot_) public view returns (bool value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getBytes32Slot(bytes32 slot_) public view returns (bytes32 value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getUint256Slot(bytes32 slot_) public view returns (uint256 value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getStringSlot(bytes32 slot_) public view returns (string memory value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getBytesSlot(bytes32 slot_) public view returns (bytes memory value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function getBytesSlot(bytes32 slot_, uint256 index_) public view returns (bytes1 value_) {
        assembly {
            value_ := byte(0, mload(add(sload(slot_), add(shl(0x05, index_), 0x20))))
        }
    }
}
