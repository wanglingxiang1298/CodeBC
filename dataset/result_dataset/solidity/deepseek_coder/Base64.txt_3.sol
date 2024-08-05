pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes encodedBytes = abi.encodePacked(data);
        string memory b64Encoded = string(base64.encode(encodedBytes));
        return b64Encoded;
    }
}