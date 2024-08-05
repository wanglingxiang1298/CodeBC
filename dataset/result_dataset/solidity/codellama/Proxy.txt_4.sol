pragma solidity ^0.8.20;

abstract contract IERC1271 {
    function _delegate(address implementation, bytes memory data) public {
        assembly {
            let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            returndatacopy(ptr, 0, size)
            switch result
            case 0 { revert(ptr, size) }
            default { return(ptr, size) }
        }
    }

    function _implementation() public view returns (address) {
        return address(this);
    }

    function _fallback() public {
        _delegate(_implementation(), msg.data);
    }

    fallback() external payable {
        _fallback();
    }
}