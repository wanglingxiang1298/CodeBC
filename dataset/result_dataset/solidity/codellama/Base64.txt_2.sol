pragma solidity ^0.8.20;

library Base64 {
    function encode(bytes memory data) internal pure returns (string memory) {
        return _encode(data);
    }

    function _encode(bytes memory data) private pure returns (string memory) {
        bytes memory encoded = new bytes(data.length * 4 / 3);
        uint256 encodedLength = encoded.length;
        uint256 dataLength = data.length;
        uint256 i = 0;
        uint256 j = 0;
        while (i < dataLength) {
            uint256 value = uint256(data[i]);
            encoded[j++] = _base64Chars[value >> 2];
            encoded[j++] = _base64Chars[(value & 0x3) << 4];
            i++;
        }
        if (i < dataLength) {
            uint256 value = uint256(data[i]);
            encoded[j++] = _base64Chars[(value & 0xF) << 2];
            encoded[j++] = _base64Chars[value >> 6];
        }
        return string(encoded);
    }

    function _base64Chars(uint256 value) private pure returns (string memory) {
        if (value < 26) {
            return string(abi.encodePacked('A', value));
        } else if (value < 52) {
            return string(abi.encodePacked('a', value - 26));
        } else if (value < 62) {
            return string(abi.encodePacked('0', value - 52));
        } else if (value == 62) {
            return string(abi.encodePacked('+', 0));
        } else if (value == 63) {
            return string(abi.encodePacked('/', 0));
        } else {
            return string(abi.encodePacked('=', 0));
        }
    }
}
