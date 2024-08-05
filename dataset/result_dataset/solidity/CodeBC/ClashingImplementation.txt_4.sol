pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed sender, uint256 amountPaid);
    function upgradeToAndCall(address _newImplementation, bytes memory _data) public payable {
        emit ClashingImplementationCall(msg.sender, msg.value);
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
}
