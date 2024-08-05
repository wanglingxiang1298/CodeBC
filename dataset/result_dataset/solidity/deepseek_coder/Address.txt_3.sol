pragma solidity ^0.8.20;
import "./Address.sol";
contract TargetContract {
    uint256 public constant MAX_SEND_VALUE = 1000000000; // Maximum send value
    function sendValue(uint256 value) public payable returns (bool) {
        require(msg.value <= MAX_SEND_VALUE, "Max send value exceeded");
        _transfer(msg.sender, value);
        return true;
    }
    function functionCall() public returns (bool) {
        Address.call(msg.sender, "functionName()");
        return true;
    }
    function functionCallWithValue(uint256 value) public returns (bool) {
        Address.callValue(msg.sender, "functionName()", value);
        return true;
    }
    function functionStaticCall() public returns (bool) {
        Address.staticCall(msg.sender, "functionName()");
        return true;
    }
    function functionDelegateCall() public returns (bool) {
        Address.delegateCall(msg.sender, "functionName()");
        return true;
    }
    function verifyCallResultFromTarget(bool result) private returns (bool) {
        require(result, "Function call failed");
        return true;
    }
    function verifyCallResult(bool result) public returns (bool) {
        require(result, "Function call failed");
        return true;
    }
    function _revert() private {
        revert("Error message"); // Replace with your error message
    }
}