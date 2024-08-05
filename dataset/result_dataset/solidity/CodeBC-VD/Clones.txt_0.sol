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
        return ecrecover(keccak256(abi.encodePacked(bytes1(0xff), deployer, address(this), target, salt)), v, r, s);
    }
    function createClone(address target, bytes memory initData) internal returns (address result) {
        return build(target, initData, false);
    }
    function createCloneDeterministic(address target, bytes32 salt, bytes memory initData) internal returns (address result) {
        return build(target, initData, true, salt);
    }
    function build(address target, bytes memory initData, bool isDeterministic, bytes32 salt) private returns (address result) {
        bytes32 ptr;
        assembly {
            ptr := mload(0x40)
            mstore(ptr, initData)
            mstore(add(ptr, 0x04), target)
            mstore(add(ptr, 0x24), shl(0x60, isDeterministic))
            if isDeterministic {
                mstore(add(ptr, 0x44), salt)
            }
            result := create(0, add(ptr, 0x06), 0x43)
        }
        require(result!= address(0), "ERC1167FailedCreateClone");
    }
}