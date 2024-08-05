pragma solidity ^0.8.20;

interface IVotes {
    function getVotes(address account) external view returns (uint256);
    function getPastVotes(address account, uint256 blockNumber) external view returns (uint256);
    function getPastTotalSupply(uint256 blockNumber) external view returns (uint256);
    function delegates(address account) external view returns (address);
    function delegate(address delegator, address delegatee) external;
    function delegateBySig(address delegator, uint256 nonce, uint256 expiry, bytes32 r, bytes32 s) external;

    event DelegateChanged(address indexed delegator, address indexed originalDelegate, address indexed newDelegate);
    event DelegateVotesChanged(address indexed delegate, uint256 previousVotes, uint256 newVotes);
}