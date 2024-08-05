pragma solidity ^0.8.20;
contract CompTimelock {
    event TransactionQueued(bytes32 txHash, uint256 eta);
    event TransactionCancelled(bytes32 txHash);
    event TransactionExecuted(bytes32 txHash);
    uint256 public constant GRACE_PERIOD = 14 days;
    uint256 public constant DELAY = 2 days;
    address public admin;
    address public pendingAdmin;
    mapping(bytes32 => bool) public queuedTransactions;
    constructor() {
        admin = msg.sender;
    }
    modifier onlyAdmin() {
        require(msg.sender == admin, "CompTimelock: caller is not the admin");
        _;
    }
    function setDelay(uint256 delay_) public onlyAdmin {
        require(delay_ >= DELAY, "CompTimelock: New delay is too short");
        DELAY = delay_;
    }
    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "CompTimelock: caller is not the pending admin");
        admin = msg.sender;
        pendingAdmin = address(0);
    }
    function setPendingAdmin(address pendingAdmin_) public onlyAdmin {
        require(pendingAdmin_!= address(0), "CompTimelock: pending admin is required");
        pendingAdmin = pendingAdmin_;
    }
    function queueTransaction(bytes32 txHash, uint256 eta) public onlyAdmin {
        require(txHash!= bytes32(0), "CompTimelock: Transaction hash is required");
        require(queuedTransactions[txHash]!= true, "CompTimelock: Transaction already queued");
        queuedTransactions[txHash] = true;
        emit TransactionQueued(txHash, eta);
    }
    function cancelTransaction(bytes32 txHash) public onlyAdmin {
        require(txHash!= bytes32(0), "CompTimelock: Transaction hash is required");
        require(queuedTransactions[txHash] == true, "CompTimelock: Transaction is not queued");
        queuedTransactions[txHash] = false;
        emit TransactionCancelled(txHash);
    }
    function executeTransaction(bytes32 txHash) public onlyAdmin {
        require(txHash!= bytes32(0), "CompTimelock: Transaction hash is required");
        require(queuedTransactions[txHash] == true, "CompTimelock: Transaction is not queued");
        queuedTransactions[txHash] = false;
        emit TransactionExecuted(txHash);
        (bool success, bytes memory returndata) = txHash.delegatecall{ gas: 1000000, gasPrice: 1000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000