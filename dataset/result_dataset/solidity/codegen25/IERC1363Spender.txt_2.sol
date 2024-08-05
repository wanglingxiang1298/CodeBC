pragma solidity ^0.8.20;
interface IERC1363Spender {
    function onApprovalReceived(address owner, uint256 amount, bytes calldata data) returns (bytes4);
}