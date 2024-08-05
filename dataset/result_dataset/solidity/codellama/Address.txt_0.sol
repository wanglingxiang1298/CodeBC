pragma solidity ^0.8.20;

library Address {
    function sendValue(address payable target, uint256 amount) public {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, ) = target.call{value: amount}("");
        require(success, "Failed to send value");
    }

    function functionCall(address target, bytes memory data) public {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Failed to call function");
    }

    function functionCallWithValue(address target, uint256 amount, bytes memory data) public {
        require(target.balance >= amount, "Insufficient balance");
        (bool success, bytes memory result) = target.call{value: amount}(data);
        require(success, "Failed to call function with value");
    }

    function functionStaticCall(address target, bytes memory data) public view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.staticcall(data);
        require(success, "Failed to call function statically");
    }

    function functionDelegateCall(address target, bytes memory data) public {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.delegatecall(data);
        require(success, "Failed to delegate call");
    }

    function verifyCallResultFromTarget(address target, bytes memory data) public view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Failed to call function");
        require(result.length > 0, "No result returned");
    }

    function verifyCallResult(bytes memory result) public pure {
        require(result.length > 0, "No result returned");
    }

    function _revert() public pure {
        revert("Transaction reverted");
    }
}