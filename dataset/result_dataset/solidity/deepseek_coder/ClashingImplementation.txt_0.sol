pragma solidity ^0.8.20;
contract ClashingImplementation {
    uint256 public numCalls;
    address payable public implementation;
    event ClashingImplementationCall(address indexed caller, address indexed implementation, bytes memory data, uint256 value);
    constructor(uint256 initialValue) {
        numCalls = initialValue;
    }
    modifier onlyImplementation() {
        require(address(this) == implementation, "Unauthorized access.");
        _;
    }
    modifier nonpayable() {
        revert("Function can only be called with ether.");
    }
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable onlyImplementation nonpayable returns (bool) {
        require(newImplementation != address(this), "Cannot upgrade to this contract.");
        (bool success, ) = ContractFallback(newImplementation, data);
        require(success, "Upgrade failed.");
        implementation = newImplementation;
        emit ClashingImplementationCall(msg.sender, newImplementation, data, msg.value);
        return true;
    }
    function delegatedFunction() public view pure returns (bool) {
        return true;
    }
}
contract ContractFallback {
    bytes memory constant DATA;
    modifier onlyOwner() {
        require(msg.sender == owner, "Unauthorized access.");
        _;
    }
    modifier onlyContractFallback() {
        require(this.address == msg.sender, "Function can only be called from this contract.");
        _;
    }
    modifier onlyData() {
        require(DATA == data, "Invalid data.");
        _;
    }
    modifier nonpayable() {
        revert("Function can only be called with ether.");
    }
    function () payable onlyOwner onlyContractFallback onlyData {
    }
    function () onlyPayable ownerOnly onlyContractFallback onlyData {
    }
}