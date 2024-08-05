pragma solidity ^0.8.20;
interface IVotes {
    function vote(uint256 id, bytes32 sig) public returns (bool);
    function getVotes(address account) view public returns (uint256);
    function getPastVotes(address account, uint256 timestamp) view public returns (uint256);
    function getPastTotalSupply(address account, uint256 timestamp) view public returns (uint256);
    function delegates(address account) view public returns (address);
    function delegate(address newDelegate) public returns (bool);
    event DelegateChanged(address previousDelegate, address newDelegate);
    event DelegateVotesChanged(address delegate, uint256 previousVotes, uint256 newVotes);
}