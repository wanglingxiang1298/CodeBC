pragma solidity ^0.8.20;
interface IERC20 {
    uint256 totalSupply();
    uint256 balanceOf(address);
    event Transfer(address, address, uint256);
    event Approval(address, address, uint256);
    function transfer(address, uint256, bytes);
    function allowance(address, address);
    function approve(address, uint256, bytes);
    function transferFrom(address, address, uint256, bytes);
}