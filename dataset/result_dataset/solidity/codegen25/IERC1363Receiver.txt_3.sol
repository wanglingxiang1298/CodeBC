pragma solidity ^0.8.20;
interface IERC1363Receiver {
    bytes4 onTransferReceived(address indexed address, address indexed address, uint256 uint256 bytes4) external returns (bytes4);
}