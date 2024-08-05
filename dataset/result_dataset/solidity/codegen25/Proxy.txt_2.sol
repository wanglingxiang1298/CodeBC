pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address _implementation) {
        _implementation = _implementation;
    }
    function _delegate(bytes memory _data) private view external returns (bytes memory) {
        return delegatecall(gasPrice(), _implementation, _data);
    }
    function _implementation() private view external returns (address) {
        return implementation();
    }
    function _fallback() private view external returns (bytes memory) {
        bytes memory _data = convert.call(data, "bytes32", "uint256");
        return delegatecall(gasPrice(), _implementation, _data);
    }
    function fallback() public {
        bytes memory _data = convert.call(data, "bytes", "uint256");
        call(gasPrice(), _implementation, _data);
    }
    function delegate(bytes memory _data) private view external returns (bytes memory) {
        return _delegate(_data);
    }
    function implementation() private view returns (address) {
        return _implementation;
    }
    function fallback(bytes memory _data) private view external returns (bytes memory) {
        return _fallback();
    }
    function convert(Convert convert) private view returns (bytes memory) {
        bytes32 _data = convert.call(data, "bytes32", "uint256");
        return delegatecall(gasPrice(), _implementation, _data);
    }
}