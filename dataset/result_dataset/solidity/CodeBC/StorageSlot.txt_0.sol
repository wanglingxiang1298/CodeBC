pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(bytes32 slot_) internal pure returns (address) {
        return abi.decode(
            getBytesSlot(slot_, 20),
            (address)
        );
    }
    function getBooleanSlot(bytes32 slot_) internal pure returns (bool) {
        return getBytesSlot(slot_, 1)!= bytes("0");
    }
    function getBytes32Slot(bytes32 slot_) internal pure returns (bytes32) {
        return bytes32(uint256(getBytesSlot(slot_, 32)) >> uint256(128));
    }
    function getUint256Slot(bytes32 slot_) internal pure returns (uint256) {
        return uint256(getBytesSlot(slot_, 32));
    }
    function getStringSlot(bytes32 slot_) internal pure returns (string memory) {
        return string(getBytesSlot(slot_, bytes(getStringSlot(slot_)).length));
    }
    function getStringSlot(bytes32 slot_) internal pure returns (bytes32) {
        return bytes32(uint256(getBytesSlot(slot_, 32)) >> uint256(128));
    }
    function getBytesSlot(bytes32 slot_, uint256 length_) internal pure returns (bytes memory) {
        return abi.decode(
            getBytesSlot(slot_, length_ + 31 >> uint256(5)),
            (bytes)
       )[length_];
    }
    function getBytesSlot(bytes32 slot_, uint256 length_) internal pure returns (bytes32) {
        return bytes32(uint256(getBytesSlot(slot_, length_ + 31 >> uint256(5))) >> uint256(256 - 8));
    }
    function setAddressSlot(bytes32 slot_, address value_) internal {
        setBytesSlot(slot_, abi.encodePacked(value_));
    }
    function setBooleanSlot(bytes32 slot_, bool value_) internal {
        setBytesSlot(slot_, bytes(value_? "1" : "0"));
    }
    function setBytes32Slot(bytes32 slot_, bytes32 value_) internal {
        setBytesSlot(slot_, abi.encodePacked(value_));
    }
    function setUint256Slot(bytes32 slot_, uint256 value_) internal {
        setBytesSlot(slot_, abi.encodePacked(value_));
    }
    function setStringSlot(bytes32 slot_, string memory value_) internal {
        setBytesSlot(slot_, bytes(value_));
    }
    function setBytesSlot(bytes32 slot_, bytes memory value_) internal {
        bytes32 slotValue_ = bytes32(uint256(slot_) >> uint256(256 - 8));
        assembly {
            sstore(slotValue_, add(value_, 31))
        }
    }
    function getBytesSlot(bytes32 slot_, uint256 length_) internal pure returns (bytes memory) {
        bytes32 value_;
        assembly {
            value_ := sload(slot_)
        }
        bytes memory valueBytes_;
        assembly {
            valueBytes_ := mload(0x40)
        }
        uint256 value_;
        assembly {
            value_ := mload(add(valueBytes_, length_))
        }
        return valueBytes_;
    }
}

