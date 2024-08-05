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

        // use the built-in Base64 encoding function
        string memory base64 = Base64.encode(data);

        // remove the padding characters
        string memory result = base64.replace("=", "");

        return result;
    }
}