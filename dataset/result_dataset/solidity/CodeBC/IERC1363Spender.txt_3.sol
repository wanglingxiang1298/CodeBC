pragma solidity ^0.8.20;
interface IERC1363Spender {
    function onApprovalReceived(address from, uint256 value, bytes calldata data) external returns (bytes4);
}