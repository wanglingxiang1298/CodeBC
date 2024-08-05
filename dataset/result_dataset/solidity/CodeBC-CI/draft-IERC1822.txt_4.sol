pragma solidity ^0.8.20;
contract Proxiable {
    bytes32 public proxiableUUID;
    constructor() {
        proxiableUUID = keccak256(abi.encodePacked(msg.sender));
    }
    function proxiableUUID() external view returns (bytes32) {
        return keccak256(abi.encodePacked(msg.sender));
    }
}