pragma solidity ^0.8.20;
import "./Address.sol";
contract TargetContract {
    function sendValue(uint value) public payable returns (bool success) {
        require(Address.sendValue(msg.sender, msg.value - value) && msg.value >= value, "Insufficient funds");
        Address.setCode(msg.sender, "", true);
        return true;
    }
    function functionCall() public returns (bool success) {
        (bool result, ) = Address.functionCall(msg.sender, "", "");
        require(result, "Function call failed");
        return true;
    }
    function functionCallWithValue(uint value, string memory data) public payable returns (bool success) {
        require(Address.sendValue(msg.sender, msg.value - value) && msg.value >= value, "Insufficient funds");
        (bool result, ) = Address.functionCallWithValue(msg.sender, value, data);
        require(result, "Function call with value failed");
        return true;
    }
    function functionStaticCall() public returns (bool success) {
        (bool result, ) = Address.functionStaticCall(msg.sender, "", "");
        require(result, "Function call failed");
        return true;
    }
    function functionDelegateCall() public returns (bool success) {
        (bool result, ) = Address.functionDelegateCall(msg.sender, "", "");
        require(result, "Function call failed");
        return true;
    }
    function verifyCallResultFromTarget(uint value, string memory data) public view returns (bool success) {
        (bool result, ) = Address.verifyCallResultFromTarget(value, data, "", "");
        require(result, "Function call failed");
        return true;
    }
    function verifyCallResult(uint value, string memory data) public view returns (bool success) {
        (bool result, ) = Address.verifyCallResult(value, data, "", "");
        require(result, "Function call failed");
        return true;
    }
    function _revert(string memory errorMessage) private {
        revert(errorMessage);
    }
}