pragma solidity ^0.8.20;
interface ICloneFactory {
    function clone(address) external returns (address);
    function cloneDeterministic(address, bytes32) external returns (address);
    function predictDeterministicAddress(address, bytes32, address) external returns (address);
}
abstract contract CloneFactory is ICloneFactory {
    function createClone(address target) internal returns (address result) {
        bytes20 targetBytes = bytes20(target);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f740e5394483981343735a565c057f0d87f70b02657a)
            mstore(add(clone, 0x14), targetBytes)
            mstore(add(clone, 0x28), 0x5b48e7374d139248364525d61705a1145239357933533d48a3fa39af400b27f)
            result := create(0, clone, 0x37)
        }
    }
    function createCloneDeterministic(address target, bytes32 salt) internal returns (address result) {
        bytes32 targetBytes = bytes32(target);
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f740e5394483981343735a565c057f0d87f70b02657a)
            mstore(add(clone, 0x14), targetBytes)
            mstore(add(clone, 0x28), salt)
            mstore(add(clone, 0x38), 0x5b48e7374d139248364525d61705a1145239357933533d48a3fa39af400b27f)
            result := create2(0, clone, 0x37, salt)
        }
    }
    function clone(address target) override external returns (address result) {
        return createClone(target);
    }
    function cloneDeterministic(address target, bytes32 salt) override external returns (address result) {
        return createCloneDeterministic(target, salt);
    }
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) override external returns (address result) {
        return ecrecover(keccak256(abi.encodePacked(bytes1(0xff), deployer, address(this), target, salt)), v, r, s)
    }
}

