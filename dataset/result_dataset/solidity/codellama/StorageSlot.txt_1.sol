pragma solidity ^0.8.20;

import "StorageSlot.sol";

contract MyContract {
    using StorageSlot for *;

    AddressSlot public addressSlot;
    BooleanSlot public booleanSlot;
    Bytes32Slot public bytes32Slot;
    Uint256Slot public uint256Slot;
    StringSlot public stringSlot;
    BytesSlot public bytesSlot;

    function getAddressSlot() public view returns (AddressSlot) {
        return addressSlot;
    }

    function getBooleanSlot() public view returns (BooleanSlot) {
        return booleanSlot;
    }

    function getBytes32Slot() public view returns (Bytes32Slot) {
        return bytes32Slot;
    }

    function getUint256Slot() public view returns (Uint256Slot) {
        return uint256Slot;
    }

    function getStringSlot() public view returns (StringSlot) {
        return stringSlot;
    }

    function getBytesSlot() public view returns (BytesSlot) {
        return bytesSlot;
    }
}