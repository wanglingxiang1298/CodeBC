pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    uint256 public constant MAX_CLONES = 100;
    mapping(address => CloneLibrary.Clone) public clones;
    mapping(address => bool) public deployedClones;
    function deployClone(address _target) external payable returns (address) {
        require(clones.length < MAX_CLONES, "Maximum number of clones reached");
        bytes memory clonedCode = Clones.createClone(_target, tx.origin);
        require(clonedCode.length > 0, "Failed to create clone");
        return Clones.createClone(_target, tx.origin);
    }
    function deployDeterministicClone(address _target, uint256 _salt) external payable returns (address) {
        require(clones.length < MAX_CLONES, "Maximum number of clones reached");
        bytes memory clonedCode = Clones.createDeterministicClone(_target, _salt, tx.origin);
        require(clonedCode.length > 0, "Failed to create deterministic clone");
        return Clones.createDeterministicClone(_target, _salt, tx.origin);
    }
    function predictDeterministicAddress(address _target, uint256 _salt, address _deployer) external view returns (address) {
        require(_deployer != address(0), "Invalid deployer address");
        return Clones.predictDeterministicAddress(_target, _salt, _deployer);
    }
    function getClone(address _cloneAddress) external view returns (bool) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return true;
    }
    function getCloneCode(address _cloneAddress) external view returns (bytes) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return Clones.getCode(_cloneAddress);
    }
    function getCloneCreationCode(address _cloneAddress) external view returns (bytes) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return Clones.getCreationCode(_cloneAddress);
    }
    function getCloneContract(address _cloneAddress) external view returns (contract CloneLibrary.Clone) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress];
    }
    function getCloneDeployer(address _cloneAddress) external view returns (address) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].deployer;
    }
    function getCloneTarget(address _cloneAddress) external view returns (address) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].target;
    }
    function getCloneSalt(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].salt;
    }
    function getCloneCreationBlockNumber(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationBlockNumber;
    }
    function getCloneCreationTransactionHash(address _cloneAddress) external view returns (bytes32) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationTransactionHash;
    }
    function getCloneCreationIndex(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationIndex;
    }
    function getCloneCreationGasUsed(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasUsed;
    }
    function getCloneCreationGasPriceGwei(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceGwei;
    }
    function getCloneCreationGasPriceFinney(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceFinney;
    }
    function getCloneCreationGasPriceOWei(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceOWei;
    }
    function getCloneCreationGasUsedByContract(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasUsedByContract;
    }
    function getCloneCreationGasPriceGweiByContract(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceGweiByContract;
    }
    function getCloneCreationGasPriceFinneyByContract(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceFinneyByContract;
    }
    function getCloneCreationGasPriceOWeiByContract(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationGasPriceOWeiByContract;
    }
    function getCloneCreationBlockTimestamp(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creationBlockTimestamp;
    }
    function getCloneCreationBlockTimestampByContract(address _cloneAddress) external view returns (uint256) {
        require(clones[_cloneAddress].address == _cloneAddress, "Invalid clone address");
        return clones[_cloneAddress].creation