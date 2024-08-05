pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct ClashingImplementationCall {
        address caller;
        bytes4 functionSig;
        uint256 callDataSize;
        bytes calldata callData;
    }
    event ClashingImplementationCall(address indexed caller, bytes4 functionSig, uint256 callDataSize, bytes calldata callData);
    mapping(address => bool) public deployed;
    modifier onlyDeployed() {
        require(deployed[msg.sender], "Contract is not deployed");
        _;
    }
    modifier onlyUpgraded() {
        require(msg.sender == address(0), "Contract can only be upgraded");
        _;
    }
    function upgradeToAndCall(address newAddress, bytes calldata newBool) external onlyUpgraded {
        require(newAddress.isContract, "New address is not a contract");
        require(newBool.length == 4, "Invalid function signature length");
        require(newBool[0] == 0x35, "Invalid function signature");
        require(newBool[1] == 0x6C, "Invalid function signature");
        require(newBool[2] == 0x69, "Invalid function signature");
        require(newBool[3] == 0x6E, "Invalid function signature");
        ClashingImplementationCall memory callData = new ClashingImplementationCall(msg.sender, newBool, calldata.length, calldata);
        ClashingImplementation newContract = ClashingImplementation(newAddress);
        newContract.ClashingImplementationCall(callData);
    }
    function delegatedFunction() public pure returns (bool) {
        return true;
    }
}