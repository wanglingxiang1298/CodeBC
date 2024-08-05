pragma solidity ^0.8.20;
interface IERC1363Spender {
    function onApprovalReceived(address owner, uint amount, bytes memory data) returns (bytes4 method) {}
}