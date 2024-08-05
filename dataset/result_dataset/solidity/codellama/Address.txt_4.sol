pragma solidity ^0.8.20;

library Address {
    function sendValue(address payable target, uint256 amount) internal {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, ) = target.call{value: amount}("");
        require(success, "Failed to send value");
    }

    function functionCall(address target, bytes calldata data) internal {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory returndata) = target.delegatecall(data);
        require(success, "Failed to call function");
    }

    function functionCallWithValue(address target, uint256 amount, bytes calldata data) internal {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, bytes memory returndata) = target.delegatecall{value: amount}(data);
        require(success, "Failed to call function with value");
    }

    function functionStaticCall(address target, bytes calldata data) internal view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory returndata) = target.staticcall(data);
        require(success, "Failed to call function statically");
    }

    function functionDelegateCall(address target, bytes calldata data) internal {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory returndata) = target.delegatecall(data);
        require(success, "Failed to delegate call");
    }

    function verifyCallResultFromTarget(address target, bytes calldata data) internal view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory returndata) = target.staticcall(data);
        require(success, "Failed to verify call result");
    }

    function verifyCallResult(address target, bytes calldata data) internal view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory returndata) = target.staticcall(data);
        require(success, "Failed to verify call result");
    }

    function _revert() internal {
        revert("Transaction reverted");
    }
}