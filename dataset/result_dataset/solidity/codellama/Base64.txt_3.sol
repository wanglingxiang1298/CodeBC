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

        // allocate memory for the Base64 string
        string memory base64 = new string(len * 4 / 3);

        // encode the bytes into Base64
        for (uint256 i = 0; i < len; i++) {
            base64[i * 4 / 3] = _encodeByte(data[i]);
        }

        return base64;
    }

    function _encodeByte(uint8 b) private pure returns (uint8) {
        if (b < 26) {
            return b + 65;
        } else if (b < 52) {
            return b - 26 + 71;
        } else if (b < 62) {
            return b - 52 + 48;
        } else if (b == 62) {
            return 43;
        } else if (b == 63) {
            return 47;
        } else {
            return 61;
        }
    }
}
