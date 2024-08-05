pragma solidity ^0.8.20;
interface IVotes {
    function getCurrentVotes(address account) external view returns (uint256);
    function getPastVotes(address account, uint blockNumber) external view returns (uint256);
    function getPastTotalSupply(uint blockNumber) external view returns (uint256);
    function delegates(address account) external view returns (address);
    function delegate(address delegator, address delegatee) external;
    function delegateBySig(address delegator, address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) external;
    error VotesExpiredSignature();
    event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);
    event DelegateVotesChanged(address indexed delegate, uint256 previousBalance, uint256 newBalance);
}