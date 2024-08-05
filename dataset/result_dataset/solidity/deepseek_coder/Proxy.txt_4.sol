pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address _implementation) {
        _implementation = _implementation;
    }
    function _delegate(bytes memory data) private view returns (bytes memory) {
        return delegatecall(gasPrice(), _implementation, data);
    }
    function _implementation() private view return (address) {
        return implementation();
    }
    function _fallback() private {
        bytes memory data = convert.callData();
        (bool success, bytes memory returnedData) = _delegate(data);
        if (success) {
            convert(returnedData);
        }
    }
    function fallback() public {
        _fallback();
    }
    function delegate(bytes memory data) private view returns (bytes memory) {
        return _delegate(data);
    }
    function implementation() private view return (address) {
        return _implementation;
    }
    modifier convert(bytes memory data) {
        _implementation = msg.sender;
        _fallback();
        super.convert(data);
    }
}