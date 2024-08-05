pragma solidity ^0.8.20;
import "./Address.sol";
contract TargetContract {
    function sendValue(uint value) external payable returns (bool success) {
        require(Address.sendValue(msg.sender, msg.value - value) && msg.value >= value, "Insufficient funds");
        return true;
    }
    function functionCall(string memory data) external returns (bool success) {
        bytes memory retVal = functionCallWithData(msg.sender, data);
        if (retVal == bytes32(0)) {
            return false;
        }
        return true;
    }
    function functionCallWithValue(address to, uint value, string memory data) external returns (bool success) {
        bytes memory retVal = functionCallWithData(to, data, value);
        if (retVal == bytes32(0)) {
            return false;
        }
        return true;
    }
    function functionCallWithData(address to, string memory data, uint value = 0) external returns (bytes memory retVal) {
        require(Address.sendValue(to, value) && value <= msg.value, "Insufficient funds");
        (bool success, bytes memory error) = functionDelegateCall(to, data, value);
        require(success, "Function call failed");
        retVal = functionStaticCall(to, data);
        return retVal;
    }
    function functionStaticCall(address to, string memory data) external returns (bytes memory retVal) {
        require(Address.staticCall(to, data) && msg.value <= msg.sender.balance, "Insufficient funds");
        retVal = functionDelegateCall(to, data);
        return retVal;
    }
    function functionDelegateCall(address to, string memory data, uint value = 0) external returns (bytes memory retVal) {
        require(Address.delegateCall(to, data, value) && value <= msg.value, "Insufficient funds");
        retVal = functionStaticCall(to, data);
        return retVal;
    }
    function verifyCallResultFromTarget(bytes memory retVal, string memory errorMsg) private returns (bool success) {
        require(retVal != bytes32(0), "Function call returned empty result");
        require(!errorMsg.isEqual(bytes32(0)), "Function call threw an exception");
        require(Address.verifyCallResult(retVal, errorMsg), "Function call result verification failed");
        return true;
    }
    function verifyCallResult(bytes memory retVal, string memory errorMsg) private returns (bool success) {
        require(retVal != bytes32(0), "Function call returned empty result");
        require(!errorMsg.isEqual(bytes32(0)), "Function call threw an exception");
        require(Address.verifyCallResult(retVal, errorMsg), "Function call result verification failed");
        return true;
    }
    function _revert(string memory errorMsg) private {
        revert(errorMsg);
    }
}