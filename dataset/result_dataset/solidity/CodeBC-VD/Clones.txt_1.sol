pragma solidity ^0.8.20;
library Clones {
    function cloneDeterministic(address target, bytes32 salt) internal returns (address result) {
        bytes32 _data = keccak256(abi.encodePacked(bytes1(0xff), target, salt));
        assembly {
            result := create2(0, add(0x20, _data), mload(_data), 0)
        }
        require(result!= address(0), "ERC1167FailedCreateClone");
    }
    function clone(address target) internal returns (address result) {
        bytes memory _data = abi.encodePacked(bytes1(0xff), target);
        assembly {
            result := create(0, add(0x20, _data), mload(_data))
        }
        require(result!= address(0), "ERC1167FailedCreateClone");
    }
}