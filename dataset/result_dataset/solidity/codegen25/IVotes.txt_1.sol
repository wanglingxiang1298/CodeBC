pragma solidity ^0.8.20;
interface IVotes {
    uint getVotes(address) external nonpayable;
    uint[] getPastVotes(address, uint) external nonpayable;
    uint getPastTotalSupply(address) external nonpayable;
    address delegates(address) external nonpayable;
    void delegate(address) external nonpayable;
    void delegateBySig(bytes32, address) external nonpayable;
}
event DelegateChanged(address indexed delegateFrom, address indexed delegateTo);
event DelegateVotesChanged(address indexed delegate, uint previousVotes, uint newVotes);
enum DelegateStatus {
    UNDELEGATED,
    DELEGATED,
    VOTED
}