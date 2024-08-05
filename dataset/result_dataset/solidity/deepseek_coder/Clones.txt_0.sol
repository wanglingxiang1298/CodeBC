pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    uint constant SOLIDITY_VERSION = 820000;
    function clone() public view returns (address) {
        return Clones.create(this);
    }
    function cloneDeterministic(address _contractAddress, uint256 _salt) public view returns (address) {
        return Clones.createDeterministic(_contractAddress, _salt);
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) public view returns (address) {
        return Clones.predictDeterministicAddress(_contractAddress, _salt, _deployerAddress);
    }
}