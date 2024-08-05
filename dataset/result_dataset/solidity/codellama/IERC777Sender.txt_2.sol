pragma solidity ^0.8.20;

interface IERC777Sender {
    function tokensToSend(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData) external;
}