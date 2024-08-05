pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes encodedBytes = rawToBase64(data);
        return string(encodedBytes);
    }
    function rawToBase64(bytes memory data) public pure returns (bytes memory) {
        bytes32 bits = bytes32(data.length);
        bytes32 bitMask = bytes32(0xff);
        bytes32 dataLength;
        if (data.length % 3 == 0) {
            dataLength = bytes32(data.length / 3);
        } else {
            dataLength = bytes32((data.length / 3) + 1);
        }
        bytes32 loopCounter = bytes32(0);
        bytes32 base64Chars = bytes32(0x0000003FFF);
        bytes32 base64CharsMask = bytes32(0x0000003FF);
        bytes32 base64CharMap = bytes32(0x0000003FFF);
        bytes32 charMap = bytes32(0x0000003FFF);
        bytes32 charMapMask = bytes32(0x0000003F);
        bytes32 paddingBits = bytes32(0x00);
        bytes32 paddingBitsMask = bytes32(0x07);
        bytes32 paddingBytes = bytes32(0x00);
        bytes32 paddingBytesMask = bytes32(0x03);
        bytes32 tempBits = bytes32(0x00);
        bytes32 tempBitsMask = bytes32(0x00);
        bytes32 tempBytes = bytes32(0x00);
        bytes32 tempBytesMask = bytes32(0x00);
        bytes32 tempCharMap = bytes32(0x00);
        bytes32 tempCharMapMask = bytes32(0x00);
        bytes32 tempPaddingBits = bytes32(0x00);
        bytes32 tempPaddingBitsMask = bytes32(0x00);
        bytes32 tempPaddingBytes = bytes32(0x00);
        bytes32 tempPaddingBytesMask = bytes32(0x00);
        bytes32 tempDataLength = bytes32(0x00);
        bytes32 tempDataLengthMask = bytes32(0x00);
        bytes32 tempBitMask = bytes32(0x00);
        bytes32 tempBitMaskMask = bytes32(0x00);
        bytes32 tempBitMask2 = bytes32(0x00);
        bytes32 tempBitMask2Mask = bytes32(0x00);
        bytes32 tempBitMask3 = bytes32(0x00);
        bytes32 tempBitMask3Mask = bytes32(0x00);
        bytes32 tempBitMask4 = bytes32(0x00);
        bytes32 tempBitMask4Mask = bytes32(0x00);
        bytes32 tempBitMask5 = bytes32(0x00);
        bytes32 tempBitMask5Mask = bytes32(0x00);
        bytes32 tempBitMask6 = bytes32(0x00);
        bytes32 tempBitMask6Mask = bytes32(0x00);
        bytes32 tempBitMask7 = bytes32(0x00);
        bytes32 tempBitMask7Mask = bytes32(0x00);
        bytes32 tempBitMask8 = bytes32(0x00);
        bytes32 tempBitMask8Mask = bytes