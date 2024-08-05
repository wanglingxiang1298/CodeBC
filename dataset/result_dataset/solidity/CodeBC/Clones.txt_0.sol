pragma solidity ^0.8.20;
interface ICloneFactory {
    function clone(address target) external returns (address);
    function cloneDeterministic(address target, bytes32 salt) external returns (address);
    function predictDeterministicAddress(address target, bytes32 salt, address deployer) external returns (address);
}
