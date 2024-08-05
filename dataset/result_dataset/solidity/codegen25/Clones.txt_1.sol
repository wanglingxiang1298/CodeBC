pragma solidity ^0.8.20;
contract Clones {
    struct Clone {
        address cloneAddress;
    }
    mapping (address => Clone) public clones;
    function clone() external returns (address) {
        require(clones[msg.sender].cloneAddress == address(0), "Clone already exists");
        (bool success, address cloneAddress, bytes memory memory, bytes memory error) = Clones._createClone();
        require(success, "Failed to create clone");
        clones[msg.sender].cloneAddress = cloneAddress;
        return cloneAddress;
    }
    function cloneDeterministic(address _contractAddress, bytes32 _salt) external returns (address) {
        require(clones[msg.sender].cloneAddress == address(0), "Clone already exists");
        (bool success, address cloneAddress, bytes memory memory, bytes memory error) = Clones._createCloneDeterministic(_contractAddress, _salt);
        require(success, "Failed to create deterministic clone");
        clones[msg.sender].cloneAddress = cloneAddress;
        return cloneAddress;
    }
    function predictDeterministicAddress(address _contractAddress, bytes32 _salt, address _deployerAddress) external view returns (address) {
        require(_contractAddress.length == 20, "Invalid contract address");
        require(_salt.length == 32, "Invalid salt value");
        require(_deployerAddress.length == 20, "Invalid deployer address");
        bytes32 _clonedSalt = keccak256(_contractAddress, _salt);
        return address(keccak256(_clonedSalt, _deployerAddress));
    }
    private function _createClone() internal (onlyThisContract() returns (bool, address, bytes, bytes)) {
        require(this != address(0), "Contract address cannot be empty");
        (bool _success, address _cloneAddress, bytes memory _memory, bytes memory _error) = this.clone(_cloneAddress, _memory);
        return (_success, _cloneAddress, _memory, _error);
    }
    private function _createCloneDeterministic(address _contractAddress, bytes32 _salt) internal (onlyThisContract() returns (bool, address, bytes, bytes)) {
        require(_contractAddress.length == 20, "Invalid contract address");
        require(_salt.length == 32, "Invalid salt value");
        bytes32 _clonedSalt = keccak256(_contractAddress, _salt);
        address _cloneAddress = address(keccak256(_clonedSalt));
        (bool _success, bytes memory _memory, bytes memory _error) = this.clone(_cloneAddress, _memory);
        return (_success, _cloneAddress, _memory, _error);
    }
}