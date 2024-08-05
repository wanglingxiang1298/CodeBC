pragma solidity ^0.8.20;
library Base64 {
    bytes private constant TABLE =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";
        uint256 i = 0;
        uint256 j = len - 1;
        bytes memory result = new bytes(encodedLen);
        while (i < j) {
            bytes memory t = new bytes(2);
            t[0] = uint8(uint256(data[i + 1]) >> 4);
            t[1] = uint8(uint256(data[i + 1]) & 0xf);
            result[encodedLen - j - 2] = TABLE[uint8(t[0] < 16? 1 : 0)];
            result[encodedLen - j - 1] = TABLE[uint8(t[1] < 16? 1 : 0) + uint8(t[0] < 16? 0 : 16)];
            i += 2;
            j -= 2;
        }
        if (j!= 0) {
            bytes memory t = new bytes(1);
            t[0] = uint8(uint256(data[i]) >> 2);
            result[encodedLen - j - 1] = TABLE[uint8(t[0] < 16? 1 : 0) + uint8(t[0] < 16? 0 : 16)];
        }
        return string(result);
    }
    function decode(string memory data) internal pure returns (bytes memory) {
        uint256 paddedLen = bytes(data).length;
        uint256 len = paddedLen - (paddedLen % 4);
        bytes memory result = new bytes(len / 4 * 3);
        uint256 i;
        uint256 j;
        uint256 k;
        uint256 t;
        for (i = 0; i < len; i += 4) {
            t = uint256(TABLE[uint256(data[j + 1]) >> 6]) << 18;
            t |= uint256(TABLE[uint256(data[j + 1]) >> 4 & 0x0f]) << 12;
            t |= uint256(TABLE[uint256(data[j + 1]) >> 2 & 0x0f]) << 6;
            t |= uint256(TABLE[uint256(data[j + 1]) & 0x0f]);
            result[k + 2] = byte(uint8(t >> 16));
            result[k + 1] = byte(uint8(t >> 8));
            result[k] = byte(uint8(t));
            k += 3;
        }
        return result;
    }
}

