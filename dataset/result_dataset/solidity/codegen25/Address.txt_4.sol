pragma solidity ^0.8.20;
import "./Address.sol";
contract ExampleContract {
    address payable public targetAddress;
    uint256 public transactionId;
    constructor(address payable _targetAddress) {
        require(_targetAddress != address(0), "Invalid address");
        targetAddress = _targetAddress;
    }
    function sendValue(uint256 _value) public payable returns (bool) {
        require(Address.balanceOf(targetAddress) >= _value, "Insufficient balance");
        try Address(targetAddress).transfer(_value) {
            revert("Function call failed");
        }
    }
    function functionCall() public returns (bool) {
        require(Address(targetAddress).call.value() == 0, "Function call was not a static call");
        try Address(targetAddress).call() {
            revert("Function call failed");
        }
        return true;
    }
    function functionCallWithValue(uint256 _value) public returns (bool) {
        require(Address(targetAddress).call.value() == _value, "Function call was not a dynamic call");
        try Address(targetAddress).call.value(_value) {
            revert("Function call failed");
        }
        return true;
    }
    function functionStaticCall() public returns (bool) {
        require(Address(targetAddress).staticCall.value() == 0, "Function call was not a static call");
        try Address(targetAddress).staticCall() {
            revert("Function call failed");
        }
        return true;
    }
    function functionDelegateCall() public returns (bool) {
        require(Address(targetAddress).delegateCall.value() == 0, "Function call was not a delegate call");
        try Address(targetAddress).delegateCall() {
            revert("Function call failed");
        }
        return true;
    }
    function verifyCallResultFromTarget() public view returns (bool) {
        require(Address(targetAddress).call.value() == 0, "Function call was not a static call");
        (bool result, bytes memory _) = Address(targetAddress).call.value(0, "", gasLimit);
        require(gasUsed <= gasLimit, "Function call exceeded gas limit");
        return result;
    }
    function verifyCallResult(uint256 _gasLimit) public view returns (bool) {
        (bool result, bytes memory _) = Address(targetAddress).delegateCall("", "", "", _gasLimit);
        require(gasUsed <= _gasLimit, "Function call exceeded gas limit");
        return result;
    }
    function _revert(uint256 _gasLimit, string memory _message) private {
        require(gasUsed <= _gasLimit, "Function call exceeded gas limit");
        revert(_message);
    }
}