pragma solidity ^0.8.20;
interface IVotes {
    uint256 getVotes(address) external nonpayable;
    uint256 getPastVotes(address, uint256) external nonpayable;
    uint256 getPastTotalSupply(address, uint256) external nonpayable;
    address delegates(address) external nonpayable;
    void delegate(address) external nonpayable;
    void delegateBySig(bytes32, address) external nonpayable;
    event DelegateChanged(address, address, address);
    event DelegateVotesChanged(address, uint256, uint256);
}