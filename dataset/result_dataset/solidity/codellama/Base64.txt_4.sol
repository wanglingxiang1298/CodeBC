pragma solidity ^0.8.20;

library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        return _encode(data);
    }

    function _encode(bytes memory data) private pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) {
            return "";
        }

        // allocate memory for the encoded string
        string memory encoded = new string(len * 4 / 3);

        // encode the bytes into the string
        uint256 i = 0;
        uint256 j = 0;
        while (i < len) {
            uint8 b = uint8(data[i]);
            if (b < 128) {
                encoded[j++] = b;
            } else if (b < 192) {
                encoded[j++] = b;
                encoded[j++] = b;
            } else if (b < 224) {
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
            } else if (b < 240) {
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
            } else {
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
                encoded[j++] = b;
            }
            i++;
        }

        return encoded;
    }
}