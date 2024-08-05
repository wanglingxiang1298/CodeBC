pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address payable _implementation) {
        assert(_implementation.isContract());
        _implementation = _implementation;
    }
    function _delegate() private view returns (bool) {
        return true;
    }
    function _implementation() private view returns (address) {
        return address(this);
    }
    function _fallback() private virtual pure returns (bool) {
        _delegate();
        return true;
    }
    function fallback() public pure virtual returns (bool) {
        _fallback();
    }
    function withdraw() public payable override virtual {}
}