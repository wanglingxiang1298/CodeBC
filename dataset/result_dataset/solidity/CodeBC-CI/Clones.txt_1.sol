pragma solidity ^0.8.20;
library Clones {
  event CloneCreated(address indexed clone, address indexed creator);
  event CloneCreationFailed(address indexed clone, address indexed creator);
  event DeterministicCloneCreated(address indexed clone, address indexed creator);
  event DeterministicCloneCreationFailed(address indexed clone, address indexed creator);
  function clone(address _contract) internal returns (address clone) {
    bytes memory code = abi.encodePacked(
      hex"6020348035903d5565b60005b6000600053600080359036001600052600236600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003681600080fdfe003