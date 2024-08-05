pragma solidity ^0.8.20;
contract ClashingImplementation {
    uint256 public numCalls;
    constructor() {
        numCalls = 0;
    }
    function upgradeToAndCall(address newAddress, bytes calldata data) external payable returns (bytes32, bytes) {
        require(msg.value >= 1 ether, "You must send at least 1 ether to the upgrade call.");
        (bool success, bytes memory returnData) = ClashingImplementation.at(newAddress).upgradeToAndCall(newAddress, data);
        emit ClashingImplementationCall(newAddress, data, returnData);
        return (newAddress, returnData);
    }
    function delegatedFunction() public pure {
        return true;
    }
}