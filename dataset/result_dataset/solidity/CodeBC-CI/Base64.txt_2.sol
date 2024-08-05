library Base64 {
    bytes constant private encodingMap =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    bytes constant private paddingChar = 61;
    uint8 constant private padCharIndex = 61;
    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 l       uint256 i;
        for (i = 0; i < data.length; i++) {
            bytes1 char = data[i];
            uint8 byteIndex = uint8(char);
            buffer[i] = char;
        }
        return string(buffer);
    }
    function decode(string memory data) internal pure returns (bytes memory) {
        uint256 decodedLength = getDecodedLength(data);
        bytes memory decoded = new bytes(decodedLength);
        uint256 charCount = 0;
        uint256 i;
        for (i = 0; i < data.length; i++) {
            bytes1 char = data[i];
            uint8 byteIndex = uint8(char);
            if (byteIndex < 128) {
                decoded[charCount] = char;
                charCount++;
            } else {
                break;
            }
        }
        return decoded;
    }
    function getDecodedLength(string memory data) internal pure returns (uint256) {
        uint256 i;
        uint256 len = data.length;
        for (i = 2; i < len; i++) {
            bytes1 char = data[i];
            uint8 byteIndex = uint8(char);
            if (byteIndex < 128) {
                len--;
            } else {
                break;
            }
        }
        return len;
    }
}
