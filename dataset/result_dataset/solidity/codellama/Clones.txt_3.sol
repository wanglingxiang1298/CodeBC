pragma solidity ^0.8.20;

library Clones {
    struct Clone {
        address contractAddress;
        address cloneAddress;
    }

    function clone(address _contractAddress) public returns (address) {
        assembly {
            let contractAddress := _contractAddress
            let cloneAddress := create(contractAddress)
            if iszero(cloneAddress) {
                revert(0, 0)
            }
            return cloneAddress
        }
    }

    function cloneDeterministic(address _contractAddress, uint256 _salt) public returns (address) {
        assembly {
            let contractAddress := _contractAddress
            let salt := _salt
            let cloneAddress := create2(contractAddress, salt)
            if iszero(cloneAddress) {
                revert(0, 0)
            }
            return cloneAddress
        }
    }

    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) public view returns (address) {
        assembly {
            let contractAddress := _contractAddress
            let salt := _salt
            let deployerAddress := _deployerAddress
            let predictedAddress := create2(contractAddress, salt)
            if iszero(predictedAddress) {
                revert(0, 0)
            }
            return predictedAddress
        }
    }
}