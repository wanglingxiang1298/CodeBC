pragma solidity ^ 0.8.20;
interface IERC2309 {
    event ConsecutiveTransfer(address indexed sender, address indexed receiver, uint256 value);
}