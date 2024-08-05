pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1271/IERC1271.sol";

contract MyContract is IERC1271 {
    address private _implementation;

    constructor() public {
        _implementation = address(new Implementation());
    }

    function _delegate(address implementation, bytes memory data) public {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, data)
            let result := delegatecall(gas(), implementation, ptr, calldatasize(), 0, 0)
            let size := returndatasize()
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