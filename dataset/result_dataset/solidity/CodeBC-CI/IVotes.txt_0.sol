pragma solidity ^0.8.20;
interface IVotes {
    function getVotes(address account) external view returns (uint256);
    function getPastVotes(address account, uint256 blockNumber) external view returns (uint256);
    function getPastTotalSupply(address account, uint256 blockNumber) external view returns (uint256);
    function delegates(address delegator) external view returns (address);
    function delegate(address delegator, address delegatee) external;
    function delegateBySig(address delegator, uint8 v, bytes32 r, bytes32 s, address delegatee) external;
}
