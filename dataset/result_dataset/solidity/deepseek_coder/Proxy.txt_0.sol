pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    function _delegate() private view external returns (bool) {
        require(_implementation != address(0), "Implementation contract address not set");
        bool result;
        assembly {
            result := call(_implementation, "delegateCall()", "", 36, out, calldata)
        }
        return result;
    }
    function _implementation() private view external returns (address) {
        return implementation;
    }
    function _fallback() private view external returns (bool) {
        return delegateCall();
    }
    function fallback() external pure returns (bool) {
        delegateCall();
        return true;
    }
}