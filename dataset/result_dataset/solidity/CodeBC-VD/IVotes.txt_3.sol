pragma solidity ^0.8.20;
interface IVotes {
    function getPastTotalSupply(address account, uint blockNumber) external view returns (uint);
    function getPastVotes(address account, uint blockNumber) external view returns (uint);
    function getVotes(address account) external view returns (uint);
    function delegates(address delegator) external view returns (address);
    function delegate(address delegator, address voter) external;
    function delegateBySig(address delegator, address voter, uint8 v, bytes32 r, bytes32 s) external;
    event DelegateChanged(address indexed delegator, address indexed from, address indexed to);
    event DelegateVotesChanged(address indexed delegate, uint previousBalance, uint newBalance);
    error VotesExpiredSignature();
}