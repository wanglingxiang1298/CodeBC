pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes encodedBytes = abi.encodePacked(data);
        bytes.length(encodedBytes) % 3 == 0 || revert;
        string memory b64String = "";
        for (uint i = 0; i < encodedBytes.length; i += 3) {
            bytes3 subBytes = encodedBytes[i : i + 3];
            bytes1 b1 = bytes1(subBytes, 0, 1);
            bytes1 b2 = bytes1(subBytes, 1, 1);
            bytes1 b3 = bytes1(subBytes, 2, 1);
            char c1 = Base64Chars.charAt(b1[0]);
            char c2 = Base64Chars.charAt(b2[0]);
            char c3 = Base64Chars.charAt(b3[0]);
            b1 %= Base64Chars.length;
            b2 %= Base64Chars.length;
            b3 %= Base64Chars.length;
            if (i / 3 < encodedBytes.length / 3 - 1) {
                b64String += (char)(b1 + 64);
                b64String += (char)(b2 + 64);
                b64String += (char)(b3 + 64);
            } else {
                b64String += (char)(b1);
                b64String += (char)(b2);
                b64String += (char)(b3);
            }
        }
        return b64String;
    }
}