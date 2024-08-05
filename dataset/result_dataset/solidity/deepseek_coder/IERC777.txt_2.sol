pragma solidity ^0.8.20;
interface IERC777 {
    function totalSupply() public view returns (uint256);
    function balanceOf(address) public view returns (uint256);
    function ownerOf(uint256) public view returns (address);
    function transfer(address, uint256, bytes) public;
    function approve(address, uint256, bytes) public;
    function transferFrom(address, address, uint256, bytes) public;
    function getOperator() public view returns (address);
    function setOperator(address) public;
}