pragma solidity ^0.8.20;
import "./Address.sol";
contract ExampleContract {
    address payable public targetAddress;
    constructor(address payable _targetAddress) {
        targetAddress = _targetAddress;
    }
    function sendValue(uint value) public payable returns (bool success) {
        require(Address.balanceOf(targetAddress) >= value, "Insufficient balance");
        require(Address.call(targetAddress, "sendValue", value, "", 0, {value: value, allow_revert: true}) == 1, "Function call failed");
        return true;
    }
    function functionCall() public returns (bool success) {
        require(Address.call(targetAddress, "functionCall", "", 0, {value: 0, allow_revert: true}) == 1, "Function call failed");
        return true;
    }
    function functionCallWithValue(uint value) public returns (bool success) {
        require(Address.call(targetAddress, "functionCallWithValue", value, "", 0, {value: value, allow_revert: true}) == 1, "Function call failed");
        return true;
    }
    function functionStaticCall() public returns (bool success) {
        require(Address.call(targetAddress, "functionStaticCall", "", 0, {value: 0, allow_revert: true}) == 1, "Function call failed");
        return true;
    }
    function functionDelegateCall() public returns (bool success) {
        require(Address.call(targetAddress, "functionDelegateCall", "", 0, {value: 0, allow_revert: true}) == 1, "Function call failed");
        return true;
    }
    function verifyCallResultFromTarget(bool result) public view returns (bool success) {
        require(Address.call(targetAddress, "verifyCallResultFromTarget", result, "", 0, {value: 0, allow_revert: false}) == 1, "Function call failed");
        return true;
    }
    function verifyCallResult(bool result) public view returns (bool success) {
        require(Address.call(targetAddress, "verifyCallResult", result, "", 0, {value: 0, allow_revert: false}) == 1, "Function call failed");
        return true;
    }
    function _revert(string memory message, uint8 errorCode) private {
        revert(message, errorCode);
    }
}