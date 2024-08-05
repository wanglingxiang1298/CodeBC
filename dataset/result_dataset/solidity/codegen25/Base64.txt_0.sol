pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes32 bytes32_data = rawBytes32(data);
        bytes32 padding;
        if (data.length % 3 > 0) {
        }
        bytes32 base64_data = base64Encoding(extended_data);
        if (data.length % 3 > 0) {
            base64_data = trimTrailingEquals(base64_data);
        }
    }
    function trimTrailingEquals(bytes32 data) private pure returns (bytes32) {
        bytes16 padding = bytes16(uint16(data & uint16(65535)) << 10);
        bytes32 result = data & uint256(~uint256(uint32(65535) << 18));
        return result | padding;
    }
    function base64Encoding(bytes32 data) private pure returns (bytes32) {
        bytes32 byte_1 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_2 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_3 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_4 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_5 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_6 = bytes32(uint256(data & uint256(63)) << 24);
        data = data >> uint32(6);
        bytes32 byte_7 = bytes32(uint256(data & uint256(63)) << 24);
        bytes32 extended_data = byte_1 | byte_2 | byte_3 | byte_4 | byte_5 | byte_6 | byte_7;
        bytes8 encoded_bytes = bytes8(extended_data & uint256(255) << 24) | bytes8(extended_data & uint256(255));
        bytes32 hash = keccak256(encoded_bytes);
        bytes8 first_four_bytes = bytes8(padded_hash & uint256(255) << 24) | bytes8(padded_hash & uint256(255));
        bytes8 second_four_bytes = bytes8(padded_hash & uint256(255) << 16