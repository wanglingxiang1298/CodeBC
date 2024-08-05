pragma solidity ^0.8.20;
interface IERC777 {
    function ownerOf(bytes32) external view returns (address);
    function balanceOf(address) external view returns (uint256);
    function transfer(address,uint256) external returns (bool);
    function approve(address,uint256) external returns (bool);
    function setApprovalForAll(address,bool) external returns (bool);
    function isApprovedForAll(address,address) external view returns (bool);
}