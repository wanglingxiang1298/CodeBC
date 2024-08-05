pragma solidity ^0.8.20;
interface IERC165 {
    bool supportsInterface(bytes4 interfaceId) external nonpayable view;
}