pragma solidity ^0.8.20;
abstract contract IERC1271 {
    function _delegate(address implementation) internal virtual {
        assembly {
            calldatacopy(0, 0, calldatasize())
            let result := delegatecall(gas(), implementation, 0, calldatasize(), 0, 0)
            returndatacopy(0, 0, returndatasize())
            switch result
            case 0 {revert(0, returndatasize())}
            default {return (0, returndatasize())}
        }
    }
    function _implementation() internal view virtual returns (address);
    fallback() external payable virtual {
        _fallback();
    }
    function _fallback() internal virtual {
        _delegate(_implementation());
    }
}