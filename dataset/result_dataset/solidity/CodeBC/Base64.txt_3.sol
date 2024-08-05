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
    function getChar(uint256 val, uint256 charCount)
        private
        pure
        returns (bytes memory)
    {
        if (charCount == 0) {
            return bytes("A");
        }
        bytes memory charStr = new bytes(2);
        uint256 valMod = val % 64;
        return (valMod < 26? bytes1(charStr) : bytes1(charStr + 1)) +
            bytes1(TABLE[valMod]);
    }
}
