pragma solidity ^0.8.20;
interface IERC777 {
    function ownerOf(bytes32) external view returns (address);
    function balanceOf(address) external view returns (uint256);
    function transfer(address,uint256) external;
    function approve(address,uint256) external;
    function setApprovalForAll(address,bool) external;
    function isApprovedForAll(address,address) external view returns (bool);
    event Burn(address,uint256);
    event Transfer(address,address,uint256);
    event Approval(address,address,uint256);
    event ApprovalForAll(address,address,bool);
}