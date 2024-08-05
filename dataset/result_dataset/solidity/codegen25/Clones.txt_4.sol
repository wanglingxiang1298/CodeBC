pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    struct Clone {
        address cloneAddress;
    }
    mapping(address => Clone) clones;
    function createClone() public view returns (address) {
        return Clones.create(this);
    }
    function createDeterministicClone(address _contractAddress, uint256 _salt) public view returns (address) {
        return Clones.createDeterministic(_contractAddress, _salt);
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) public view returns (address) {
        return Clones.predictDeterministicAddress(_contractAddress, _salt, _deployerAddress);
    }
    function getClone(address _cloneAddress) public view returns (bool) {
        Clone memory clone = clones[_cloneAddress];
        require(clone.cloneAddress == _cloneAddress, "Clone not found");
        return exists(_cloneAddress);
    }
}
contract Cloneable {
    function create(address _newOwner) public {
        require(msg.sender == _newOwner, "Only new owner can create clones");
        try Clones.clone() throw;
    }
    function createDeterministic(address _contractAddress, uint256 _salt) public {
        require(msg.sender == _contractAddress, "Only contract address can create deterministic clones");
        try Clones.cloneDeterministic(_contractAddress, _salt) throw;
    }
}
library Clones {
    function create(address _newOwner) internal returns (bool) {
        require(msg.sender == _newOwner, "Only new owner can create clones");
        (address cloneAddress, ) = Clones.clone();
        clones[cloneAddress] = Clone({
            cloneAddress: cloneAddress
        });
        return true;
    }
    function createDeterministic(address _contractAddress, uint256 _salt) internal returns (bool) {
        require(msg.sender == _contractAddress, "Only contract address can create deterministic clones");
        (address cloneAddress, ) = Clones.cloneDeterministic(_contractAddress, _salt);
        clones[cloneAddress] = Clone({
            cloneAddress: cloneAddress
        });
        return true;
    }
    function clone() internal returns (address) {
        require(this.code.isEqual(Cloneable.code) && this.code.isEqual(IERC1155.code), "Contract does not implement Cloneable interface");
        (address cloneAddress, ) = Clones.create2(this.address, keccak256(abi.encodePacked(this, clone.selector)));
        return cloneAddress;
    }
    function cloneDeterministic(address _contractAddress, uint256 _salt) internal returns (address) {
        require(_contractAddress.isContract(), "Contract address is invalid");
        (address cloneAddress, ) = Clones.create2(_contractAddress, keccak256(abi.encodePacked(_contractAddress, _salt)));
        return cloneAddress;
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) internal returns (address) {
        require(_contractAddress.isContract(), "Contract address is invalid");
        require(msg.sender == _deployerAddress, "Only deployer address can predict deterministic clone address");
        return Clones.predictDeterministicAddress(_contractAddress, _salt, _deployerAddress);
    }
    function clone2() internal returns (address) {
        require(this.code.isEqual(Cloneable.code) && this.code.isEqual(IERC1155.code), "Contract does not implement Cloneable interface");
        (address cloneAddress, ) = Clones.create2(this.address, keccak256(abi.encodePacked(this, clone2.selector)));
        return cloneAddress;
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) internal returns (address) {
        require(_contractAddress.isContract(), "Contract address is invalid");
        (address cloneAddress, ) = Clones.create2(_contractAddress, keccak256(abi.encodePacked(_contractAddress, _salt)));
        return cloneAddress;
    }
}