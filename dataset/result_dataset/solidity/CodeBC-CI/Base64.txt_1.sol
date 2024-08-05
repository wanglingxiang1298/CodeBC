pragma solidity ^0.8.20;
library Base64 {
    bytes constant private STANDARD_BASE64_ALPHABET = bytes("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/");
    function encode(bytes memory data) public pure returns (string memory) {
        uint256 length; i++) {
            bytes1 char = bytes1(uint8(data[i]));
            buffer.push(char);
        }
        return string(buffer);
    }
}
