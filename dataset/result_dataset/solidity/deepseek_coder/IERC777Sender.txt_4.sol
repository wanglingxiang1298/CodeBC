pragma solidity ^0.8.20;
interface IERC777Sender {
    function send(address to, uint256 amount, bytes memory userData, bytes memory operatorData) external;
}