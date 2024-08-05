pragma solidity ^0.8.20;

library Address {
    function sendValue(address payable target, uint256 value) public {
        require(target.balance >= value, "Insufficient balance");
        target.transfer(value);
    }

    function functionCall(address target, bytes memory data) public {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.call(data);
        require(success, "Internal call failed");
        verifyCallResult(result);
    }

    function functionCallWithValue(address target, uint256 value, bytes memory data) public {
        require(target.balance >= value, "Insufficient balance");
        (bool success, bytes memory result) = target.call{value: value}(data);
        require(success, "Internal call failed");
        verifyCallResult(result);
    }

    function functionStaticCall(address target, bytes memory data) public view {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.staticcall(data);
        require(success, "Internal call failed");
        verifyCallResult(result);
    }

    function functionDelegateCall(address target, bytes memory data) public {
        require(target.code.length > 0, "Target address has no code");
        (bool success, bytes memory result) = target.delegatecall(data);
        require(success, "Internal call failed");
        verifyCallResult(result);
    }

    function verifyCallResult(bytes memory result) public pure {
        if (result.length == 0) {
            revert("Call result was empty");
        }
        if (result[0]!= 0x00) {
            revert("Call result was not successful");
        }
    }

    function _revert() public pure {
        revert("Transaction reverted");
    }
}
