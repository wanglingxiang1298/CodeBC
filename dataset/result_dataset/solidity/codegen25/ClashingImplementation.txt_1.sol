pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct ClashingImplementationCall {
        address _to;
        bytes _calldata;
    }
    event ClashingImplementationCall(address _to, bytes _calldata);
    mapping (address => bool) public deployed;
    modifier onlyDeployed() {
        require(deployed[msg.sender], "Contract is not deployed");
        _;
    }
    function upgradeToAndCall(address newAddress, bytes calldata newCalldata) external payable onlyDeployed {
        ClashingImplementationCall memory _call = ClashingImplementationCall(newAddress, newCalldata);
        emit ClashingImplementationCall(_call. _call.);
        (functionSignature)(newAddress, newCalldata);
    }
    function delegatedFunction() public pure returns (bool) {
        return true;
    }
}
contract Test {
    function testClashingImplementation() public {
        ClashingImplementation(msg.sender).upgradeToAndCall(
            "0x1234567890123456789012345678901234567890",
            "0x12345678"
        );
    }
}