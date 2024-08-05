pragma solidity ^0.8.20;
abstract contract Address {
    function sendValue(address payable recipient, uint256 amount) internal {
        uint256 balanceBefore = address(this).balance;
        require(recipient.call{value: amount}(""));
        uint256 balanceAfter = address(this).balance;
        require(balanceAfter >= balanceBefore + amount, "Address: insufficient balance");
    }
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionCall(target, data, "Address: low-level call failed");
    }
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return functionStaticCall(target, data, "Address: low-level static call failed");
    }
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }
    function verifyCallResultFromTarget(address target, bytes memory returnData, string memory error) internal view returns (bytes memory) {
        (bool success, bytes memory returnData_) = target.staticcall(returnData);
        return verifyCallResult(success, returnData_, error);
    }
    function verifyCallResult(bool success, bytes memory returnData, string memory error) internal pure returns (bytes memory) {
        if (!success) {
            if (returnData.length > 0) {
                assembly {
                    let returndata_size := mload(returnData)
                    revert(add(32, returnData), returndata_size)
                }
            } else {
                revert(error);
            }
        }
        return returnData;
    }
    function _revert(string memory reason, bytes memory returnData) internal pure {
        if (returnData.length > 0) {
            assembly {
                let returndata_size := mload(returnData)
                revert(add(32, returnData), returndata_size)
            }
        } else {
            revert(reason);
        }
    }
}

