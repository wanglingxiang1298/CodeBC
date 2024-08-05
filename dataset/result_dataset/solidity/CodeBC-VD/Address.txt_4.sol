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
    function functionCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        return functionCallWithValue(target, data, 0, errorMessage);
    }
    function functionCallWithValue(address target, bytes memory data, uint256 value) internal returns (bytes memory) {
        return functionCallWithValue(target, data, value, "Address: low-level call with value failed");
    }
    function functionCallWithValue(address target, bytes memory data, uint256 value, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= value, "Address: insufficient balance for call");
        require(target.call{value: value}(data), errorMessage);
        return target.staticcall(data);
    }
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        return functionDelegateCall(target, data, "Address: low-level delegate call failed");
    }
    function functionDelegateCall(address target, bytes memory data, string memory errorMessage) internal returns (bytes memory) {
        require(address(this).balance >= msg.value, "Address: insufficient balance for delegate call");
        require(target.delegatecall(data), errorMessage);
        return target.staticcall(data);
    }
    function verifyCallResultFromTarget(address target, bytes memory returnData, string memory errorMessage) internal view returns (bytes memory) {
        (bool success, bytes memory revertData) = target.call(returnData);
        if (!(success && revertData.length == 0)) {
            revert(errorMessage);
        }
        return returnData;
    }
    function verifyCallResult(bytes memory returnData, string memory errorMessage) internal pure returns (bytes memory) {
        if (returnData.length == 0 || (returnData[0]!= bytes32(uint256(1)) && returnData[1]!= 0)) {
            revert(errorMessage);
        }
        return returnData;
    }
    function _revert(string memory errorMessage) internal pure {
        revert(errorMessage);
    }
}