pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed to, bytes data);
    function upgradeToAndCall(address _to, bytes memory _data) external payable {
        emit ClashingImplementationCall(_to, _data);
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
}