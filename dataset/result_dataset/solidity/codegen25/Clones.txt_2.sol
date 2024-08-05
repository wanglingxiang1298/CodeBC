pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    function clone() public view returns (address) {
        return Clones.create(this);
    }
    function cloneDeterministic(address _contractAddress, bytes32 _salt) public view returns (address) {
        return Clones.createDeterministic(_contractAddress, _salt);
    }
    function predictDeterministicAddress(address _contractAddress, bytes32 _salt, address _deployerAddress) public view returns (address) {
        return Clones.predictDeterministicAddress(_contractAddress, _salt, _deployerAddress);
    }
}