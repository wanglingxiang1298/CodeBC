pragma solidity ^0.8.20;
interface IERC777Recipient {
    function receive(uint256 newOwnerId, bytes memory newOwnerData, uint256 newOperatorId, bytes memory newOperatorData, uint256 newUintValue, bytes memory newBytesValue, bytes memory newMethodSignature, bytes memory newMethodData) external;
}