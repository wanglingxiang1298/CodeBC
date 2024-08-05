pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address _implementation) {
        _implementation = _implementation;
    }
    function _delegate() private view external returns (bool) {
        require(_implementation.isContract(), "Implementation contract address is not a valid contract.");
        (bool result, ) = _implementation.proxyCall(_this, "", 40000, "delegate()");
        require(result, "Delegate call failed.");
        return true;
    }
    function _implementation() private view external returns (address) {
        return _implementation;
    }
    function _fallback() private view external returns (bool) {
        _delegate();
        return true;
    }
    function fallback() external returns (bool) {
        _fallback();
        return true;
    }
}