pragma solidity ^0.8.20;
interface ICloneFactory {
    function clone(address) external returns (address);
    function cloneDeterministic(address, bytes32) external returns (address);
    function predictDeterministicAddress(address, bytes32, address) external returns (address);
}
abstract contract CloneFactory is ICloneFactory {
    function createClone(address target) internal virtual returns (address result) {
        bytes32 salt = keccak256(abi.encodePacked(target));
        assembly {
            let clone := create(0, 0, 32)
            if iszero(clone) {
                revert(0, 0)
            }
            result := clone
            let len := 0
            for {} lt(len, 32) {} {
                len := add(len, 1)
                codecopy(clone, 0, len, 32)
            }
        }
        require(result!= address(0), "ERC1167: create failed");
    }
    function cloneDeterministic(address target, bytes32 salt) internal override returns (address result) {
        result = createClone(target);
        if (target.supportsInterface(0x62b97899) && result.supportsInterface(0x62b97899)) {
            target.initSupportedInterface(result);
        }
        assembly {
            let ctx := mload(0x40)
            mstore(ctx, 0x3d602d80600a3d3981f740e5394483d39fbd5fe3b2dff74d5664270c79a6c0)
            mstore(add(ctx, 0x10), shl(0x60, result))
            mstore(add(ctx, 0x20), shl(0x40, 1))
            mstore(add(ctx, 0x25), shl(0x40, target))
            mstore(add(ctx, 0x45), shl(0x40, salt))
            mstore(add(ctx, 0x60), 0x53696e69745459504578)
            mstore(add(ctx, 0x80), 0x506572736f6e696e67ff00)
            mstore8(add(ctx, 0xa0), 0x1)
            mstore(add(ctx, 0xa1), 0x57415643ff00)
            mstore(add(ctx, 0xc0), 0x60005b60006000796000f363d6000803d6000f3636000803d6000f36060005b600080600436100000173pys{
            }
        }
    }
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) internal override returns (address result) {
        result = createClone(target);
        if (target.supportsInterface(0x62b97899) && result.supportsInterface(0x62b97899)) {
            target.initSupportedInterface(result);
        }
        assembly {
            let ctx := mload(0x40)
            mstore(ctx, 0x3d602d80600a3d3981f740e5394483d39fbd5fe3b2dff74d5664270c79a6c0)
            mstore(add(ctx, 0x10), shl(0x60, result))
            mstore(add(ctx, 0x20), shl(0x40, 1))
            mstore(add(ctx, 0x25), shl(0x40, target))
            mstore(add(ctx, 0x45), shl(0x40, salt))
            mstore(add(ctx, 0x60), 0x53696e69745459504578)
            mstore(add(ctx, 0x80), 0x506572736f6e696e67ff00)
            mstore8(add(ctx, 0xa0), 0x1)
            mstore(add(ctx, 0xa1), 0x57415643ff00)
            mstore(add(ctx, 0xc0), 0x60005b60006000796000f363d6000803d6000f3636000803d6000f36060005b600080600436100000173pys{
            }
        }
    }
}
