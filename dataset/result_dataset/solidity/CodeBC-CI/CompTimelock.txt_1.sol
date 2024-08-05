pragma solidity ^0.8.20;
contract CompTimelock {
    event QueueTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string calldata signature, bytes data, uint256 eta);
    event CancelTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string calldata signature, bytes data);
    event ExecuteTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string calldata signature, bytes data);
    uint256 public constant GRACE_PERIOD = 1 days;
    uint256 public constant DELAY = 2 days;
    address public admin;
    address public pendingAdmin;
    mapping(bytes32 => bool) public queuedTransactions;
    constructor() {
        admin = msg.sender;
    }
    function setDelay(uint256 delay_) public {
        require(msg.sender == admin, "CompTimelock:     emit ExecuteTransaction(txHash, target, value, signature, data);
    }
    function getBlockTimestamp() internal view returns (uint256) {
        return block.timestamp;
    }
}