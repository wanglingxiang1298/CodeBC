pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes encodedBytes = rawToHex(data);
        bytes32 extendedEncodedBytes = appendExtendedBase64(encodedBytes);
        return string(extendedEncodedBytes);
    }
    function rawToHex(bytes memory data) public pure returns (bytes32) {
        bytes32 result;
        for (uint256 i = 0; i < data.length; i++) {
        }
        return result;
    }
    function appendExtendedBase64(bytes32 value) public pure returns (bytes32) {
        bytes32 extendedValue = value;
        for (uint256 i = 0; i < 4; i++) {
            bytes1 byte = value & bytes32(0xff);
            value = value >> uint256(8);
        }
        return extendedValue;
    }
}