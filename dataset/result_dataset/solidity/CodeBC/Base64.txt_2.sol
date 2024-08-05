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
        if (_uint == 0) return bytes("A");
        if (_uint == uint256(-1)) return bytes("Z");
        if (_uint <= uint256(122)) return bytes(string(abi.encodePacked(char(_uint)))) ;
        if (_len == 1) {
            return bytes(string(abi.encodePacked(char(_uint % 26), char(uint256(_uint / 26)))));
        }
        if (_len == 2) {
            return bytes(string(abi.encodePacked(char(_uint % 64), char(uint256(_uint / 64)))));
        }
        if (_len == 3) {
            return bytes(string(abi.encodePacked(char(_uint % 52), char(uint256(_uint / 52)))));
        }
        return bytes("+");
    }
    function char(uint256 _uint) private pure returns (bytes1 b1) {
        if (_uint <= 9) return bytes1(uint8(48 + _uint));
        if (_uint <= 35) return bytes1(uint8(55 + _uint));
        if (_uint <= 61) return bytes1(uint8(61 + _uint));
        if (_uint == 62) return "=";
        if (_uint == 63) return "+";
        revert();
    }
}

