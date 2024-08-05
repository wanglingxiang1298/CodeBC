pragma solidity ^0.8.20;
interface IERC1820Implementer {
  function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) external view returns (bytes32);
}