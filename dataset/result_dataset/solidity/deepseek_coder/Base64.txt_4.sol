pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public view returns (string memory) {
        bytes encodedBytes = abi.encodePacked(data);
        bytes.length(encodedBytes) % 3;
        string memory encodedString = uint82base64(encodedBytes);
        string memory padding = "";
        if (encodedBytes.length % 3) {
            padding = "=";
            if (encodedBytes.length % 3 == 1) {
                padding = "==";
            }
        }
        return "data:" + "application/octet-stream" + ";base64" + padding + encodedString;
    }
    function uint82base64(bytes memory data) private view returns (string memory) {
        string memory base64Chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_";
        string memory base64CharsArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "=", "_"];
        byte[] bytes = new byte[data.length];
        for (int i = 0; i < data.length; i++) {
            bytes[i] = data[i];
        }
        int numBase64Chars = (numBits / 6) + (numBits / 300);
        string memory base64String = new string(numBase64Chars, " ");
        for (int i = 0; i < data.length; i++) {
            int byteIndex = i % 4;
            switch (byteIndex) {
                case 0:
                    base64String.toCharArray()[i / 4] = base64CharsArray[bytes[i] >> 2];
                    break;
                case 1:
                    base64String.toCharArray()[i / 4] = base64CharsArray[((bytes[i] >> 2) | (bytes[i + 1] << 6)) & 0x3FF];
                    break;
                case 2:
                    base64String.toCharArray()[i / 4] = base64CharsArray[((bytes[i] >> 2) | (bytes[i + 1] << 6) | (bytes[i + 2] << 12)) & 0x3FF];
                    break;
                case 3:
                    base64String.toCharArray()[i / 4] = base64CharsArray[((bytes[i] >> 2) | (bytes[i