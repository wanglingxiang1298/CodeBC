pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall();
    function upgradeToAndCall(address, bytes calldata) external payable {
        emit ClashingImplementationCall();
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
}