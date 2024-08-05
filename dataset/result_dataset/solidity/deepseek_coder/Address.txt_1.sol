pragma solidity ^0.8.20;
import "./Address.sol";
contract TargetContract {
    function sendValue(uint value) external payable returns (bool success) {
        require(Address.balanceOf(address(this)) >= value, "Insufficient balance");
        Address.call(address(this), "transfer", value);
        return true;
    }
    function functionCall() external returns (bool success) {
        Address.call(address(this), "functionCall");
        return true;
    }
    function functionCallWithValue(uint value) external returns (bool success) {
        Address.call(address(this), "functionCallWithValue", value);
        return true;
    }
    function functionStaticCall() external returns (bool success) {
        Address.staticCall(address(this), "functionStaticCall");
        return true;
    }
    function functionDelegateCall() external returns (bool success) {
        Address.delegateCall(address(this), "functionDelegateCall");
        return true;
    }
    function verifyCallResultFromTarget(uint value) external returns (bool success) {
        (bool result, bytes memory error) = Address.call(address(this), "verifyCallResult", value);
        require(result, "Function call failed");
        return true;
    }
    function verifyCallResult(uint value) external returns (bool success) {
        (bool result, bytes memory error) = Address.call(address(this), "verifyCallResult", value);
        require(result, "Function call failed");
        return true;
    }
    function _revert(uint value) private {
        revert("Error: " + uintToString(value));
    }
    function uintToString(uint value) private view returns (string) {
        uint divisor = 1;
        string result = "";
        while (value > 0) {
            result = string(value % divisor) + result;
            value /= divisor;
        }
        return result;
    }
}