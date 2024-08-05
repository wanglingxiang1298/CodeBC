pragma solidity ^0.8.20;

abstract contract IERC1271 {
    address private _implementation;

    constructor() {
        _implementation = address(0);
    }

    function _delegate(address implementation, bytes memory data) public {
        assembly {
            let result := delegatecall(gas(), implementation, add(data, 32), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    function _implementation() public view returns (address) {
        return _implementation;
    }

    function _fallback() public {
        _delegate(_implementation, msg.data);
    }

    fallback() external payable {
        _fallback();
    }
}