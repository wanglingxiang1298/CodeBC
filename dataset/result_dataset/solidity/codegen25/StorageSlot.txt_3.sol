pragma solidity ^0.8.20;
library StorageSlot {
    function getAddressSlot(uint256 slot) internal view returns (address) {
        return address(uint160(slot) << 248) >> 8;
    }
    function getBooleanSlot(uint256 slot) internal view returns (bool) {
        return bytes32(slot << 248) % 256 == 1;
    }
    function getBytes32Slot(uint256 slot) internal view returns (bytes32) {
        return bytes32((uint256(slot) << 248) + (uint256(slot) << 224) + (uint256(slot) << 192) + (uint256(slot) << 160) + (uint256(slot) << 128) + (uint256(slot) << 96) + (uint256(slot) << 64) + (uint256(slot) << 32) + 1);
    }
    function getUint256Slot(uint256 slot) internal view returns (uint256) {
        return uint256(bytes32(slot << 248) % uint256(1 << 224));
    }
    function getStringSlot(uint256 slot) internal view returns (string) {
        bytes32 data = getBytes32Slot(slot);
        int256 num = int256(data);
        uint256 lastTwoBytes = uint256(data) % uint256(1 << 16);
        if (lastTwoBytes >= uint256(0xD800) && lastTwoBytes < uint256(0xE000)) {
            num /= uint256(0x10000);
        }
        return String(data);
    }
    function getBytesSlot(uint256 slot) internal view returns (bytes) {
        bytes32 data = getBytes32Slot(slot);
        int256 num = int256(data);
        uint256 lastTwoBytes = uint256(data) % uint256(1 << 16);
        if (lastTwoBytes >= uint256(0xD800) && lastTwoBytes < uint256(0xE000)) {
            num /= uint256(0x10000);
        }
        return bytes(data);
    }
}