pragma solidity ^0.8.20;

library Address {
    function sendValue(address payable target, uint256 amount) internal {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, ) = target.call{value: amount}("");
        require(success, "Failed to send value");
    }

    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        require(target.code.length > 0, "Target address does not have code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Failed to call function");
        return result;
    }

    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        require(target.code.length > 0, "Target address does not have code");
        (bool success, bytes memory result) = target.call{value: value}(data);
        require(success, "Failed to call function with value");
        return result;
    }

    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        require(target.code.length > 0, "Target address does not have code");
        (bool success, bytes memory result) = target.staticcall(data);
        require(success, "Failed to call function statically");
        return result;
    }

    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        require(target.code.length > 0, "Target address does not have code");
        (bool success, bytes memory result) = target.delegatecall(data);
        require(success, "Failed to delegate call");
        return result;
    }

    function verifyCallResultFromTarget(address target, bytes memory data) internal view returns (bool) {
        require(target.code.length > 0, "Target address does not have code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Failed to call function");
        return result;
    }

    function verifyCallResult(bytes memory result) internal pure returns (bool) {
        require(result.length > 0, "Result is empty");
        return result[0] == 0x1;
    }

    function _revert() internal pure {
        revert("Reverted");
    }
}