pragma solidity ^0.8.20;
interface IERC777Recipient {
    function receive(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes calldata userData,
        bytes calldata operatorData
    ) external returns (bytes32);
}