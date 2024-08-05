pragma solidity ^ 0.8.20;
interface IERC20 {
    uint256 totalSupply();
    uint256 balanceOf(address);
    function transfer(address, uint256);
    function allowance(address, address);
    function approve(address, uint256);
    function transferFrom(address, address, uint256);
}