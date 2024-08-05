pragma solidity ^0.8.20;
library Clones {
    function createClone(address implementation) internal returns (address instance) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x3d602d80600a3d3981f740e539448391816040596883f402c983603d8760)
            mstore(add(ptr, 0x14), shl(0x60, implementation))
            mstore(add(ptr, 0x28), 0x5b506279971b1ee114a6cf6407736d2eccblock.number)
            instance := create(0, ptr, 0x37)
        }
        require(instance!= address(0), "ERC1167: create failed");
    }
    function createClone(
        address implementation,
        bytes32 salt
    ) internal returns (address instance) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x51392a068db06d3180fdaf5dc57d34999673a0d3fd77e30806d918beb13800)
            mstore(add(ptr, 0x04), shl(0x60, implementation))
            mstore(add(ptr, 0x28), salt)
            mstore(add(ptr, 0x38), 0x5b506279971b1ee114a6cf6407736d2eccblock.number)
            instance := create2(0, ptr, 0x5b, add(shl(0x60, implementation), salt))
        }
        require(instance!= address(0), "ERC1167: create2 failed");
    }
    function predictDeterministicAddress(
        address implementation,
        bytes32 salt,
        address deployer
    ) internal pure returns (address predicted) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x51392a068db06d3180fdaf5dc57d34999673a0d3fd77e30806d918beb13800)
            mstore(add(ptr, 0x04), shl(0x60, implementation))
            mstore(add(ptr, 0x28), salt)
            mstore(add(ptr, 0x38), 0x5b506279971b1ee114a6cf6407736d2eccblock.number)
            predicted := add(shl(0x60, implementation), salt)
            predicted := keccak256(ptr, 0x5b)
        }
    }
}