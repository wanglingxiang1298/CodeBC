pragma solidity ^0.8.20;
library Base64 {
    function encode(bytes memory data) public pure returns (string memory) {
        bytes encodedBytes = rawToHex(data);
        bytes32 extendedEncodedBytes = appendExtendedBase64Encoding(encodedBytes);
        return string(extendedEncodedBytes);
    }
    function rawToHex(bytes memory data) public pure returns (bytes32) {
        bytes32 result;
        for (uint256 i = 0; i < data.length; i++) {
        }
        return result;
    }
    function appendExtendedBase64Encoding(bytes32 data) public pure returns (bytes32) {
        bytes4 byte1 = bytes4(data & 0xFFFFFFFF);
        bytes4 byte2 = bytes4((data >> 32) & 0xFFFFFFFF);
        bytes4 byte3 = bytes4((data >> 64) & 0xFFFFFFFF);
        bytes4 byte4 = bytes4((data >> 96) & 0xFFFFFFFF);
        bytes32 extendedEncodedBytes = rawToBase64(byte1)
            + rawToBase64(byte2)
            + rawToBase64(byte3)
            + rawToBase64(byte4)
            + rawToBase64(padding);
        return extendedEncodedBytes;
    }
    function rawToBase64(bytes4 data) public pure returns (bytes32) {
        bytes32 result;
        if (data == 0) {
            result = 0;
        } else {
            bytes16 bits = bytes16(uint16(data) << 48);
            result = (bits & 0x000000000000FFF0) | 0x0000003FFF;
            if (bits & 0x0000000000000FFF) {
                result = (bits & 0x0000000000003FFF) | 0x000003FF;
                if (bits & 0x000000000003FF) {
                    result = (bits & 0x00000000003FF) | 0x0003F;
                    if (bits & 0x000000000FF) {
                        result = (bits & 0x0000000003F) | 0x00FC;
                        if (bits & 0x00000FF) {
                            result = (bits & 0x000003F) | 0x3E;
                            if (bits & 0x000FF) {
                                result = (bits & 0x0003F) | 0xFC;
                                if (bits & 0x00FF) {
                                    result = (bits & 0x003F) | 0x3E;
                                    if (bits & 0x0FF) {
                                        result = (bits & 0x03F) | 0xFC;
                                        if (bits & 0xFF) {
                                            result = (bits & 0x3F) | 0x3E;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return result;
    }
}