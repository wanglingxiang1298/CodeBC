pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    uint constant SOLIDITY_VERSION = 820000;
    constructor(address payable _owner) {
        Clones(_owner, address(this).code.hash) ;
    }
    function clone() public returns (address) {
        return Clones(msg.sender, address(this).code.hash).create();
    }
    function cloneDeterministic(address _contractAddress, bytes32 _salt) public returns (address) {
        return Clones(_contractAddress, _salt).create2();
    }
    function predictDeterministicAddress(address _contractAddress, bytes32 _salt, address _deployerAddress) public view returns (address) {
        return Clones(_contractAddress, _salt).predictDeterministicAddress(_deployerAddress);
    }
}