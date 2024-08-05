pragma solidity ^0.8.20;
interface IERC1363Receiver {
    bytes4 onTransferReceived() external returns (bytes4);
}