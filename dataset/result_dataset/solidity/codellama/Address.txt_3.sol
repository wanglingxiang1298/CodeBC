pragma solidity ^0.8.20;

library Address {
    function sendValue(address payable target, uint256 amount) internal {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, ) = target.call{value: amount}("");
        require(success, "Failed to send value");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Failed to call function");
        return result;
    }

    function functionCallWithValue(address target, uint256 amount, bytes memory data) internal returns (bytes memory) {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, bytes memory result) = target.call{value: amount}(data);
        require(success, "Failed to call function with value");
        return result;
    }

    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.staticcall(data);
        require(success, "Failed to call static function");
        return result;
    }

    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.delegatecall(data);
        require(success, "Failed to delegate call");
        return result;
    }

    function verifyCallResultFromTarget(address target, bytes memory result) internal pure {
        require(target.code.length > 0, "Target address has no code");
        require(result.length > 0, "Result is empty");
        require(result[0] == 0x00, "Result is not successful");
    }

    function verifyCallResult(bytes memory result) internal pure {
        require(result.length > 0, "Result is empty");
        require(result[0] == 0x00, "Result is not successful");
    }

    function _revert() internal pure {
        revert("Reverted");
    }
}
