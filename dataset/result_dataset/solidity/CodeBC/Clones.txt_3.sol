pragma solidity ^0.8.20;
interface ICloneFactory {
    function clone(address) external returns (address);
    function cloneDeterministic(address, bytes32) external returns (address);
    function predictDeterministicAddress(address, bytes32, address) external returns (address);
}
abstract contract CloneFactory is ICloneFactory {
    function createClone(address target) internal returns (address result) {
        bytes32 salt = keccak256(abi.encodePacked(target));
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d730000000000000000000000)
            mstore(add(clone, 0x14), target)
            mstore(add(clone, 0x28), 0x5b40173f5b7a67b75bdb76fd57800b4816bfa1ef2c15d72f4935bcfbbc5850)
            result := create(0, clone, 0x37)
        }
    }
    function createCloneDeterministic(address target, bytes32 salt) internal returns (address result) {
        assembly {
            let clone := mload(0x40)
            mstore(clone, 0x3d602d80600a3d3981f3363d3d373d3d3d363d730000000000000000000000)
            mstore(add(clone, 0x14), target)
            mstore(add(clone, 0x28), salt)
            mstore(add(clone, 0x38), 0x5b40173f5b7a67b75bdb76fd57800b4816bfa1ef2c15d72f4935bcfbbc5850)
            result := create2(0, clone, 0x37, salt)
        }
    }
    function cloneDeterministic(address target, bytes32 salt) external override returns (address result) {
        return createCloneDeterministic(target, salt);
    }
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) external override returns (address result) {
        uint256 saltedAddress;
        assembly {
            saltedAddress := add(shl(0, target), salt)
        }
        return address(uint160(uint(keccak256(abi.encodePacked(0xff, deployer, saltedAddress, keccak256(abi.encodePacked(0xdeputils.deploy.clones.create2.selector, target, salt, deployer)))))));
    }
}
