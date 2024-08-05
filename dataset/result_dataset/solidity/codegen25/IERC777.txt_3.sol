pragma solidity ^0.8.20;
interface IERC777 {
    function name() public view returns (string memory);
    function symbol() public view returns (string memory);
    function balanceOf(address) public view returns (uint256);
    function totalSupply() public view returns (uint256);
    function allowance(address, address) public view returns (uint256);
    function transfer(address, uint256) public;
    function transferFrom(address, address, uint256) public;
    function approve(address, uint256) public;
    event Minted(address, uint256, bytes);
    event Burned(address, uint256, bytes);
    event AuthorizedOperator(address, address);
    event RevokedOperator(address, address);
    event Sent(address, address, uint256, bytes);
}