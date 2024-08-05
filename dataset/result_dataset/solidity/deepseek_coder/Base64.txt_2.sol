pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public view returns (string memory) {
        bytes encoded = uintToBase64(uint256(data.length));
        encoded += "=";
        encoded += bytesToBase64(data);
        encoded += "=";
        return encoded;
    }
    function uintToBase64(uint256 number) private view returns (string memory) {
        string constant table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        bytes memory output = new bytes(11);
        uint256 mask = 0b000000111111;
        uint256 i = 0;
        for (uint8 j = 0; j < 4; j++) {
            uint256 chunk = number & mask;
            number >>= 6;
            output[i++] = bytes32(chunk < 4 ? 0x30 : 0x3E) + (chunk < 4 ? chunk : chunk - 4);
        }
        return bytes32(output).toBytes32(0, 32, 32);
    }
    function bytesToBase64(bytes memory data) private view returns (string memory) {
        string constant table = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
        uint256 mask = 0b000000111111;
        uint256 i = 0;
        for (uint8 j = 0; j < data.length; j++) {
            uint256 chunk = uint256(data[j]);
            output[i++] = bytes32(table.indexOfBytes(uint8(chunk >> 2))) + bytes32(table.indexOfBytes(uint8(chunk & 3)));
            if (j % 3 == 2) {
                output[i++] = 32;
            }
        }
        if (data.length % 3 == 1) {
            output[i++] = 32;
        }
        if (data.length % 3 == 2) {
            output[i++] = 64;
        }
        return bytes32(output).toBytes32(0, 32, 32);
    }
}