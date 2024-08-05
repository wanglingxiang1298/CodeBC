pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes32 bytes32_data = keccak256(data);
        bytes32 ascii_data = convertBytes32ToASCII(bytes32_data);
        string memory base64_data = convertASCIIToBase64(ascii_data);
        return base64_data;
    }
    function convertBytes32ToASCII(bytes32 data) private pure returns (string memory) {
        string memory result = "";
        for (uint256 i = 0; i < data.length; i++) {
            if (i % 4 == 0) {
                result = concat(concat(result, "="), data[i]);
            } else {
                result = concat(result, data[i]);
            }
        }
        return result;
    }
    function convertASCIIToBase64(string memory data) private pure returns (string memory) {
        bytes32 padding = flipBytes32(bytes32(0));
        bytes32 padded_data = bitwiseAnd(bitwiseOr(dataToBytes32(data), padding), ~padding);
        bytes16 bytes16_data = convertBytes32ToBytes16(padded_data);
        string memory base64_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        string memory result = "";
        for (uint16 i = 0; i < 16; i++) {
            uint8 byte0 = bytes16_data[i] >> 2;
            uint8 byte1 = ((bytes16_data[i] & 0x03) << 4) | (bytes16_data[i + 1] >> 4);
            uint8 byte2 = ((bytes16_data[i + 1] & 0x0F) << 2) | (bytes16_data[i + 2] >> 6);
            uint8 byte3 = bytes16_data[i + 2] & 0x3F;
            if (i == 14) {
                byte2 = 0;
                byte3 = 0;
            } else if (i == 15) {
                byte3 = 0;
            }
            result = concat(concat(result, substring(base64_chars, byte0, 1)), substring(base64_chars, byte1, 1));
            if (byte2 > 0) {
                result = concat(concat(result, substring(base64_chars, byte2, 1)), substring(base64_chars, byte3, 1));
            } else {
                result = concat(result, substring(base64_chars, byte3, 1));
            }
        }
        return result;
    }
    function dataToBytes32(string memory data) private pure returns (bytes32) {
        bytes32 result = 0;
        for (uint256 i = 0; i < data.length; i++) {
        }
        return result;
    }
    function dataCharToBytes32(uint8 char)