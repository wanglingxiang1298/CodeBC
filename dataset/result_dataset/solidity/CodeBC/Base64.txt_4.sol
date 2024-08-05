pragma solidity ^0.8.20;
library Base64 {
    bytes private constant TABLE =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";
        uint256 i;
        uint256 j;
        uint256 charCount;
        bytes memory result = new bytes(len + 3);
        for (i = 0; i < len; i++) {
            uint256 uintVal = uint256(uint8(data[i]));
            bytes memory charStr = getChar(uintVal, charCount);
            result[j++] = charStr[0];
            result[j++] = charStr[1];
            i += (charCount == 3)? 2 : 1;
        }
        return string(result);
    }
    function getChar(uint256 _uint, uint256 _len) private pure returns (bytes memory) {
        if (_uint == 0) return bytes("AA");
        bytes memory alphabet = TABLE;
        bytes memory charStr = new bytes(2);
        while (_uint > 0 && _len > 0) {
            uint256 val = _uint % 64;
            if (val > 0) {
                _uint = _uint / 64;
                _len--;
            }
            charStr[1] = alphabet[val];
            return charStr;
        }
        return charStr;
    }
}
