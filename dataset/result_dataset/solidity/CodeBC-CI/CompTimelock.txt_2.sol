Solidity 0.8.20:
pragma solidity ^0.8.20;
contract CompTimelock {
    event QueueTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string signature, bytes data, uint256 eta);
    event CancelTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string signature, bytes data);
    event ExecuteTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string signature, bytes data);
    uint256 public constant GRACE_PERIOD = 14 days;
    uint256 public constant DELAY = 2 days;
    address public admin;
    address public pendingAdmin;
    mapping(bytes32 => bool) public queuedTransactions;
    constructor() {
        admin = msg.sender;
    }
    modifier onlyAdmin() {
        require(msg.sender == admin, "Timelock: Forbidden");
        _;
    }
    function setDelay(uint256 delay_) public onlyAdmin {
        require(delay_ >= DELAY, "Timelock: Delay too short");
        DELAY = delay_;
    }
    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "Timelock: Forbidden");
        admin = msg.sender;
        pendingAdmin = address(0);
    }
    function setPendingAdmin(addressa), "Timelock: Forbidden");
        uint256 eta = block.timestamp + DELAY;
        bytes32 txHash = keccak256(abi.encodePacked(target, value, signature, data, eta));
        queuedTransactions[txHash] = true;
        emit QueueTransaction(txHash, target, value, signature, data, eta);
        return true;
    }
    function cancelTransaction(address target, uint256 value, string memory signature, bytes memory data, uint256 eta) public onlyAdmin returns (bool) {
        require(eta >= block.timestamp, "Timelock: Forbidden");
        bytes32 txHash = keccak256(abi.encodePacked(target, value, signature, data, eta));
        queuedTransactions[txHash] = false;
        emit CancelTransaction(txHash, target, value, signature, data);
        return true;
    }
    function executeTransaction(address target, uint256 value, string memory signature, bytes memory data, uint256 eta) public onlyAdmin returns (bool) {
        require(queuedTransactions[keccak256(abi.encodePacked(target, value, signature, data, eta))], "Timelock: Forbidden");
        queuedTransactions[keccak256(abi.encodePacked(target, value, signature, data, eta))] = false;
        bytes memory callData = abi.encodePacked(bytes4(keccak256(bytes(signature))), data);
        (bool success, ) = target.call{value: value}(callData);
        require(success, "Timelock: Transaction execution reverted.");
        emit ExecuteTransaction(keccak256(abi.encodePacked(target, value, signature, data, eta)), target, value, signature, data);
        return true;
    }
}