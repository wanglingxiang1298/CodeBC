pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct Implementation {
        address impl;
        bool isUpgradeable;
    }
    mapping(address => Implementation) private implementations;
    function upgradeToAndCall(address newImpl, bytes calldata newPayload) external payable returns (bytes) {
        require(implementations[msg.sender].isUpgradeable, "Cannot upgrade to an old implementation");
        implementations[msg.sender].impl = newImpl;
        implementations[msg.sender].isUpgradeable = false;
        bytes memory result = newImpl.clashingImplementationCall(newPayload, msg.gas);
        ClashingImplementation.ClashingImplementationCall(newImpl, newPayload, result);
        return result;
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
}