pragma solidity ^0.8.20;
interface IERC777 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address) external view returns (uint256);
    function ownerOf(uint256) external view returns (address);
    function getApproved(uint256) external view returns (address);
    function approve(address, uint256) external;
    function setApprovalForAll(address, bool) external;
    function isApprovedForAll(address, address) external view returns (bool);
    function transfer(address, uint256) external;
    function transferFrom(address, address, uint256) external;
    event Burn(address, uint256);
    event Transfer(address, address, uint256);
    event Approval(address, address, uint256);
    event ApprovalForAll(address, address, bool);
}