pragma solidity ^0.8.20;
import "./Address.sol";
contract ExampleContract {
    uint256 public numCalls;
    address payable public targetAddress;
    constructor(address payable _targetAddress) {
        targetAddress = _targetAddress;
    }
    function sendValue(uint256 _value) public payable returns (bool _success) {
        _success = Address.sendValue(targetAddress, _value);
    }
    function functionCall() public returns (bool _success) {
        _success = Address.functionCall(targetAddress, "getData()");
    }
    function functionCallWithValue(uint256 _value) public payable returns (bool _success) {
        _success = Address.functionCallWithValue(targetAddress, "getData()", _value);
    }
    function functionStaticCall() public returns (bool _success) {
        _success = Address.functionStaticCall(targetAddress, "getData()");
    }
    function functionDelegateCall() public returns (bool _success) {
        _success = Address.functionDelegateCall(targetAddress, "getData()");
    }
    function verifyCallResultFromTarget() private returns (bool _success) {
        (bool _result, bytes memory _error) = Address.verifyCallResultFromTarget(targetAddress, "getData()");
        if (_result) {
            _success = true;
        } else {
            _success = false;
        }
    }
    function verifyCallResult() private returns (bool _success) {
        (bool _result, bytes memory _error) = Address.verifyCallResult(targetAddress, "getData()");
        if (_result) {
            _success = true;
        } else {
            _success = false;
        }
    }
    function _revert() private {
        revert("An error occurred.");
    }
}