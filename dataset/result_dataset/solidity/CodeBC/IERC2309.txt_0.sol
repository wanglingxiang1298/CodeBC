pragma solidity ^0.8.20;
interface IERC2309 {
    event ConsecutiveTransfer(address indexed from, address indexed to, uint256 amount);
    function transfer(address to, uint256 amount) external;
    function transferFrom(address from, address to, uint256 amount) external;
}
