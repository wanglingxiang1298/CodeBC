pragma solidity ^0.8.20;
import "./Address.sol";
contract TestContract {
    uint256 constant MAX_UINT256 = 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff;
    function sendValue(uint value, address payable recipient) {
        require(value <= MAX_UINT256, "Invalid value sent");
        require(Address.balanceOf(this) >= value, "Insufficient balance");
        recipient.transfer(value);
    }
    function functionCall(bytes4 functionName, bytes32[] memory inputParams) private returns (bytes) {
        bytes[] memory outputs = new bytes[1][](1);
        outputs[0] = functionName;
        require(Address.call(this, outputs, inputParams), "Function call failed");
        return outputs[0];
    }
    function functionCallWithValue(bytes4 functionName, bytes32[] memory inputParams, uint value) private returns (bytes) {
        bytes[] memory outputs = new bytes[1][](1);
        outputs[0] = functionName;
        require(Address.callValue(value, this, outputs, inputParams), "Function call with value failed");
        return outputs[0];
    }
    function functionStaticCall() private returns (bytes) {
        bytes[] memory outputs = new bytes[1][](1);
        outputs[0] = FunctionStaticCallLibrary.testFunction();
        require(Address.staticCall(this, outputs, 0, 0, 0), "Static function call failed");
        return outputs[0];
    }
    function functionDelegateCall() private returns (bytes) {
        bytes[] memory outputs = new bytes[1][](1);
        outputs[0] = FunctionDelegateCallLibrary.testFunction();
        require(Address.delegateCall(this, outputs, 0, 0), "Delegate function call failed");
        return outputs[0];
    }
    function verifyCallResultFromTarget(bytes4 functionName, bytes32[] memory inputParams, uint value) private view {
        require(Address.call(this, inputParams, inputParams), "Function call failed");
        require(Address.callValue(value, this, inputParams, inputParams), "Function call with value failed");
        require(Address.staticCall(this, inputParams, 0, 0, 0), "Static function call failed");
        require(Address.delegateCall(this, inputParams, 0, 0), "Delegate function call failed");
    }
    function verifyCallResult(bytes4 functionName, bytes32[] memory inputParams, uint value) private view {
        bytes memory outputData = functionCall(functionName, inputParams);
        require(Address.verifyCallResult(outputData, inputParams, value), "Function call result verification failed");
        outputData = functionCallWithValue(functionName, inputParams, value);
        require(Address.verifyCallResult(outputData, inputParams, value), "Function call with value result verification failed");
        outputData = functionStaticCall();
        require(Address.verifyCallResult(outputData, inputParams, value), "Static function call result verification failed");
        outputData = functionDelegateCall();
        require(Address.verifyCallResult(outputData, inputParams, value), "Delegate function call result verification failed");
    }
    function _revert(string memory errorMessage) private {
        revert(errorMessage);
    }
}