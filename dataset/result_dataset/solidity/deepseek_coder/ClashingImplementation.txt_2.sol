pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct ClashingImplementationCall {
        address _to;
        bytes4 _function;
        bytes memory _parameters;
    }
    mapping(address => uint256) public nonce;
    mapping(address => address) public implementation;
    event ClashingImplementationCall(address indexed _from, address indexed _to, bytes4 indexed _function, bytes memory indexed _parameters);
    modifier onlyFromImplementation() {
        require(msg.sender == implementation[msg.sender], "Unauthorized call.");
        _;
    }
    function upgradeToAndCall(address newImplementation, bytes calldata newImplementationInitialization) external onlyFromImplementation {
        require(newImplementation != address(0), "Invalid address.");
        require(newImplementationInitialization.length <= 1024, "Initialization too long.");
        require(ClashingImplementation.isContract(newImplementation), "Invalid contract address.");
        require(ClashingImplementation.isFunctionDelegated(newImplementationInitialization), "Invalid function delegated.");
        require(msg.value == 0, "Payable function.");
        implementation[msg.sender] = newImplementation;
        emit ClashingImplementationCall(msg.sender, newImplementation, newImplementationInitialization[0:4], newImplementationInitialization[4:]);
    }
    function delegatedFunction() external pure returns (bool) {
        return true;
    }
    function isFunctionDelegated(bytes calldata function) external pure returns (bool) {
        return true;
    }
}