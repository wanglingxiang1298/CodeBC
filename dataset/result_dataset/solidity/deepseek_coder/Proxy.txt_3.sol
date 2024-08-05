pragma solidity ^0.8.20;
contract Proxy {
    address private implementation;
    constructor(address _implementation) {
        implementation = _implementation;
    }
    function _delegate(bytes memory data) private view returns (bytes memory) {
        return implementation.call(data);
    }
    function _implementation() private view returns (address) {
        return implementation;
    }
    function _fallback() private {
        implementation.fallback();
    }
    function fallback() public {
        _fallback();
    }
    function() external view {}
}