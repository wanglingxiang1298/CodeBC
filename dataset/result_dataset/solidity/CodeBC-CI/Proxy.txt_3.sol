pragma solidity ^0.8.20;
contract ERC1271 is IERC1271 {
    address public implementation;
    constructor(address _implementation) {
        implementation = _implementation;
    }
    function _delegate(bytes memory data) internal {
        assembly {
            let result := delegatecall(gas(), implementation, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize
            let ptr := mload(0x40)
            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                let ptr := add(data, 0x20)
                let result := mload(ptr)
                mstore(0x40, and(result, not(mask)))
                let size := returndatasize
                returndatacopy(ptr, 0, size)
                switch result
                case 0 {
                    revert(ptr, size)
                }
                default {
                    return(ptr, size)
                }
            }
        }
    }
    function _implementation() internal view returns (address) {
        return implementation;
    }
    function _fallback() internal {
        _delegate(msg.data);
    }
    fallback() external payable {
        _fallback();
    }
}