pragma solidity ^0.8.20;
library StorageSlot {
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
    function getBytesSlot(bytes32 slot_, uint256 length_) public view returns (bytes memory value_) {
        assembly {
            value_ := sload(slot_)
        }
    }
    function setAddressSlot(bytes32 slot_, address value_) internal {
        assembly {
            sstore(slot_, value_)
        }
    }
    function setBooleanSlot(bytes32 slot_, bool value_) internal {
        assembly {
            sstore(slot_, value_)
        }
    }
    function setBytes32Slot(bytes32 slot_, bytes32 value_) internal {
        assembly {
            sstore(slot_, value_)
        }
    }
    function setUint256Slot(bytes32 slot_, uint256 value_) internal {
        assembly {
            sstore(slot_, value_)
        }
    }
    function setStringSlot(bytes32 slot_, string memory value_) internal {
        assembly {
            sstore(slot_, add(value_, 32))
        }
    }
    function setBytesSlot(bytes32 slot_, bytes memory value_) internal {
        assembly {
            sstore(slot_, add(value_, 32))
        }
    }
    function setBytesSlot(bytes32 slot_, bytes memory value_, uint256 length_) internal {
        assembly {
            sstore(slot_, add(value_, 32))
        }
    }
}
