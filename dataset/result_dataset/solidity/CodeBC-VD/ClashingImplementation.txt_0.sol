pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed sender, address indexed contractAddress, bytes data);
    function upgradeToAndCall(address payable contractAddress, bytes memory data) external payable {
        emit ClashingImplementationCall(msg.sender, contractAddress, data);
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
}