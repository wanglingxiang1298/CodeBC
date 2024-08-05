pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed sender, bytes data);
    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable {
        (bool success, ) = newImplementation.delegatecall(data);
        require(success, "Delegated call failed");
        emit ClashingImplementationCall(msg.sender, data);
    }
}