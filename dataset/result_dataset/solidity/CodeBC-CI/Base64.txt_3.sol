pragma solidity ^0.8.20;
library Base64 {
    bytes constant private TABLE = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
    function encode(bytes memory data) public pure returns (string memory) {
        uint256 l       uint256 i;
        for (i = 0; i < data.length; i++) {
            bytes1 char = data[i];
            uint8 idx = uint8(char);
            str[i] = TABLE[idx];
        }
        return str;
    }
}
