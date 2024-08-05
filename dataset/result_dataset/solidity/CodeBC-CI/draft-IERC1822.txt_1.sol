pragma solidity ^0.8.20;
contract Proxiable {
    bytes32 public proxiableUUID;
    constructor() {
        proxiableUUID = bytes32(uint256(address(this)).div(16));
    }
    function proxiableUUID() external view returns (bytes32) {
        return bytes32(uint256(address(this)).div(16));
    }
}