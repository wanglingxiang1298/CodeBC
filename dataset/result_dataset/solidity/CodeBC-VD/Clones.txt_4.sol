pragma solidity ^0.8.20;
abstract contract CloneFactory {
    function cloneDeterministic(address target, bytes32 salt) internal returns (address result) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x3d6060fd000000000000000000000000000000000000000000000000000000)
            mstore(add(ptr, 0x04), target)
            mstore(add(ptr, 0x24), salt)
            mstore(add(ptr, 0x44), 0x00000000000000000000000000000000000000000000000000005fa3b6)
            result := create2(0, add(ptr, 0x06), 0, shl(0x60, target))
        }
        require(result!= address(0), "ERC1167FailedCreateClone");
    }
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) internal view returns (address predicted) {
        return ecrecover(keccak256(abi.encodePacked(bytes1(0xff), deployer, address(this), target, salt)), v, r, s) ;
    }
    function createClone(address target, bytes memory data) internal returns (address result) {
        return build(target, data, false) ;
    }
    function createCloneDeterministic(address target, bytes32 salt, bytes memory data) internal returns (address result) {
        return build(target, data, true, salt) ;
    }
    function build(address target, bytes memory data, bool deterministic, bytes32 salt) private returns (address result) {
        assembly {
            let ptr := mload(0x40)
            mstore(ptr, 0x3d6060fd000000000000000000000000000000000000000000000000000000)
            mstore(add(ptr, 0x04), target)
            mstore(add(ptr, 0x24), shr(0x60, mload(add(data, 0x20))))
            mstore(add(ptr, 0x44), shr(0x60, mload(add(data, 0x1c))));
            mstore(add(ptr, 0x64), shr(0x60, mload(add(data, 0x18))));
            mstore(add(ptr, 0x84), shr(0x60, mload(add(data, 0x14))));
            mstore(add(ptr, 0xa4), shr(0x60, mload(add(data, 0x10))));
            mstore(add(ptr, 0xc4), shr(0x60, mload(add(data, 0x0c))));
            mstore(add(ptr, 0xe4), shr(0x60, mload(add(data, 0x08))));
            mstore(add(ptr, 0x104), shr(0x60, mload(add(data, 0x04))));
            mstore(add(ptr, 0x124), shr(0x60, mload(add(data, 0x00))));
            mstore(add(ptr, 0x144), salt)
            mstore(add(ptr, 0x164), 0x00000000000000000000000000000000000000000000000000005fa3b6)
            result := create2(0, add(ptr, 0x06), 0, shl(0x60, target))
        }
        require(result!= address(0), "ERC1167FailedCreateClone");
    }
}