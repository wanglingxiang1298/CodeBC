pragma solidity ^0.8.20;
interface IERC777Recipient {
    function receive(uint256 operatorType, bytes32[] memory topics, bytes memory data) external;
}