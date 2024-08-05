pragma solidity ^0.8.20;

library Clones {
    struct Clone {
        address contractAddress;
        address cloneAddress;
    }

    function clone(address _contractAddress) public returns (address) {
        assembly {
            let cloneAddress := create(_contractAddress)
            if iszero(cloneAddress) {
                revert(0, 0)
            }
            return cloneAddress
        }
    }

    function cloneDeterministic(address _contractAddress, uint256 _salt) public returns (address) {
        assembly {
            let cloneAddress := create2(_contractAddress, _salt)
            if iszero(cloneAddress) {
                revert(0, 0)
            }
            return cloneAddress
        }
    }

    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) public view returns (address) {
        assembly {
            let cloneAddress := create2(_contractAddress, _salt, _deployerAddress)
            return cloneAddress
        }
    }
}