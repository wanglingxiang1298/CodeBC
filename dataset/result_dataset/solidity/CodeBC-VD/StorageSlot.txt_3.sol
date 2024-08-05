pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(bytes32 slot_) public view returns (address) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (address)
        );
    }
    function getBooleanSlot(bytes32 slot_) public view returns (bool) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (bool)
        );
    }
    function getBytes32Slot(bytes32 slot_) public view returns (bytes32) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (bytes32)
        );
    }
    function getUint256Slot(bytes32 slot_) public view returns (uint256) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (uint256)
        );
    }
    function getStringSlot(bytes32 slot_) public view returns (string memory) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (string)
        );
    }
    function getBytesSlot(bytes32 slot_) public view returns (bytes memory) {
        return abi.decode(
            uint256(keccak256(abi.encodePacked(msg.sender, slot_))),
            (bytes)
        );
    }
    function setAddressSlot(bytes32 slot_, address value_) public {
        uint256 value = uint256(value_);
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
    function setBooleanSlot(bytes32 slot_, bool value_) public {
        uint256 value = uint256(value_);
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
    function setBytes32Slot(bytes32 slot_, bytes32 value_) public {
        uint256 value = uint256(value_);
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
    function setUint256Slot(bytes32 slot_, uint256 value_) public {
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value_),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
    function setStringSlot(bytes32 slot_, string memory value_) public {
        uint256 value = uint256(value_);
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
    function setBytesSlot(bytes32 slot_, bytes memory value_) public {
        uint256 value = uint256(value_);
        assembly {
            sstore(
                add(slot_, 1),
                or(
                    shl(216, value),
                    and(
                        div(mload(add(value_, 1)), exp(256, sub(216, shl(216, 1)))),
                        255
                    )
                )
            )
        }
    }
}
