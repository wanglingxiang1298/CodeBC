pragma solidity ^0.8.20;

contract ClashingImplementation {
    event ClashingImplementationCall(address indexed _from, bytes _data);

    function upgradeToAndCall(address _target, bytes memory _data) public payable {
        emit ClashingImplementationCall(msg.sender, _data);
    }

    function delegatedFunction() public pure returns (bool) {
        return true;
    }
}