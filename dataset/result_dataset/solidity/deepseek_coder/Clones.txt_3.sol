pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    uint constant keccak256Cost = 300000;
    function clone() public view returns (address) {
        return Clones.create(this, keccak256Cost);
    }
    function cloneDeterministic(address _contractAddress, bytes32 _salt) public view returns (address) {
        return Clones.createDeterministic(_contractAddress, _salt, kecc256Cost);
    }
    function predictDeterministicAddress(address _contractAddress, bytes32 _salt, address _deployerAddress) public view returns (address) {
        return Clones.predictDeterministicAddress(_contractAddress, _salt, _deployerAddress, kecc256Cost);
    }
}