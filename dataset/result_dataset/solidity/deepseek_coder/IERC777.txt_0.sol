pragma solidity ^0.8.20;
interface IERC777 {
    function ownerOf(uint256) public view returns (address);
    function balanceOf(address) public view returns (uint256);
    function transfer(address, uint256, bytes) public returns (bool);
    function approve(address, uint256, bytes) public returns (bool);
    function transferFrom(address, address, uint256) public returns (bool);
}