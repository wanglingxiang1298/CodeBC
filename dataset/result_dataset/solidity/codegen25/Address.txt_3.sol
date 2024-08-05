pragma solidity ^0.8.20;
import "./Address.sol";
contract TargetContract {
    function sendValue(uint value) public payable {
        require(address(this).balance >= value, "Insufficient balance");
        Address.sendValue(msg.sender, msg.value);
    }
    function functionCall(address targetAddress, bytes memory data) public {
        Address.functionCall(targetAddress, data);
    }
    function functionCallWithValue(address targetAddress, uint value, bytes memory data) public {
        require(address(this).balance >= value, "Insufficient balance");
        Address.functionCallWithValue(targetAddress, value, data);
    }
    function functionStaticCall(address targetAddress, bytes memory data) public {
        Address.functionStaticCall(targetAddress, data);
    }
    function functionDelegateCall(address targetAddress, bytes memory data) public {
        Address.functionDelegateCall(targetAddress, data);
    }
    function verifyCallResultFromTarget(uint256 result) private {
        require(result == 1, "Function call failed");
    }
    function verifyCallResult(uint256 result) public {
        verifyCallResultFromTarget(result);
    }
    function _revert(string memory errorMessage) private {
        revert(errorMessage);
    }
}