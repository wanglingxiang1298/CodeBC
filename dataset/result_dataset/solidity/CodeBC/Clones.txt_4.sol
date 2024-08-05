pragma solidity ^0.8.20;
interface ICloneFactory {
    function clone(address target) external returns (address);
    function cloneDeterministic(address target, bytes32 salt) external returns (address);
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) external returns (address);
}
library Clones {
    function createClone(address target) internal returns (address result) {
        bytes memory instanceData = new bytes(0);
        assembly {
            let clone := create(0, add(instanceData, 0x20), mload(instanceData))
            if iszero(clone) {
                revert(0, 0)
            }
            result := clone
        }
        ICloneFactory(target).clone(result);
    }
    function createCloneDeterministic(address target, bytes32 salt) internal returns (address result) {
        bytes memory instanceData = new bytes(0);
        assembly {
            let clone := create2(0, add(instanceData, 0x20), mload(instanceData), salt)
            if iszero(clone) {
                revert(0, 0)
            }
            result := clone
        }
        ICloneFactory(target).cloneDeterministic(result, salt);
    }
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) internal returns (address result) {
        assembly {
            let clone := create2(0, 0, 0, salt)
            if iszero(clone) {
                revert(0, 0)
            }
            result := clone
        }
        ICloneFactory(target).predictDeterministicAddress(result, salt, deployer);
    }
}
