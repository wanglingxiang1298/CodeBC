pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed sender, bytes data);
    modifier onlyOwner() {
        require(msg.sender == owner, "ClashingImplementation: caller is not the owner");
        _;
    }
    address payable private owner;
    constructor() {
        owner = payable(msg.sender);
    }
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable {
        (bool success, bytes memory returndata) = newImplementation.delegatecall(data);
        require(success, "ClashingImplementation: delegatecall failed");
        emit ClashingImplementationCall(msg.sender, data);
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
    function changeOwner(address payable newOwner) external onlyOwner {
        owner = newOwner;
    }
}
