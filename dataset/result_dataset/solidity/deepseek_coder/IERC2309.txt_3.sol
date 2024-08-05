pragma solidity ^ 0.8.20;
interface IERC2309 {
    event ConsecutiveTransfer(address indexed fromAddress, address indexed toAddress, uint256 amount);
}