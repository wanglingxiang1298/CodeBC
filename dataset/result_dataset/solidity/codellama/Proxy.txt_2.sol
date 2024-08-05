pragma solidity ^0.8.20;

abstract contract IERC1271 {
    function _delegate(address implementation, bytes memory data) public {
        // Use assembly language instructions to make the delegate call and handle the return result
        assembly {
            let result := delegatecall(gas(), implementation, add(data, 32), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
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
        // Return the address of the implementation contract
        return address(this);
    }

    function _fallback() public {
        // Call the _delegate function to delegate the call to the implementation contract
        _delegate(_implementation(), msg.data);
    }

    fallback() external payable {
        // Receive Ether and call the _fallback function to handle the logic
        _fallback();
    }
}