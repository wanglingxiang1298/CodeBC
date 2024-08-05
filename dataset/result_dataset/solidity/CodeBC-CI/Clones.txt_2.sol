pragma solidity ^0.8.20;
library Clones {
  event CloneCreated(address indexed clone, address indexed creator);
  event CloneDeterministicCreated(address indexed clone, address indexed creator, uint256 salt);
  event PredictDeterministicAddress(address indexed clone, address indexed creator, uint256 salt);
  function clone(address _contractAddress) public returns (address cloneAddress) {
    assembly {
      let clone := create(_contractAddress)
      if iszero(extcodesize(clone)) {
        revert(0, 0)
      }
    }
    emit CloneCreated(cloneAddress, msg.sender);
    return cloneAddress;
  }
  function cloneDeterministic(address _contractAddress, uint256 _salt) public returns (address cloneAddress) {
    assembly {
      let clone := create2(_contractAddress, _salt)
      if iszero(extcodesize(clone)) {
        revert(0, 0)
      }
    }
    emit CloneDeterministicCreated(cloneAddress, msg.sender, _salt);
    return cloneAddress;
  }
  function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _creatorAddress) public view returns (address cloneAddress) {
    bytes32 salt = keccak256(abi.encodePacked(_salt, _creatorAddress));
    assembly {
      let clone := create2(_contractAddress, salt)
      if iszero(extcodesize(clone)) {
        revert(0, 0)
      }
    }
    emit PredictDeterministicAddress(cloneAddress, msg.sender, _salt);
    return cloneAddress;
  }
}