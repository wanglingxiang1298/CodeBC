pragma solidity ^0.8.20;
contract CompTimelock {
    event AdminChanged(address indexed newAdmin);
    event DelayChanged(uint256 indexed newDelay);
    event PendingAdminChanged(address indexed newPendingAdmin);
    event TransactionQueued(bytes32 indexed hash, uint256 indexed eta);
    event TransactionCancelled(bytes32 indexed hash);
    event TransactionExecuted(bytes32 indexed hash);
    address public admin;
    address public pendingAdmin;
    uint256 public delay;
    uint256 public gracePeriod;
    mapping(bytes32 => bool) public queuedTransactions;
    constructor() {
        admin = msg.sender;
        delay = 2 days;
        gracePeriod = 2 weeks;
    }
    modifier onlyAdmin() {
        require(msg.sender == admin, "CompTimelock: caller is not the admin");
        _;
    }
    function setDelay(uint256 newDelay) public onlyAdmin {
        delay = newDelay;
        emit DelayChanged(newDelay);
    }
    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "CompTimelock: caller is not the pending admin");
        admin = msg.sender;
        pendingAdmin = address(0);
        emit AdminChanged(admin);
    }
    function setPendingAdmin(address newPendingAdmin) public onlyAdmin {
        pendingAdmin = newPendingAdmin;
        emit PendingAdminChanged(pendingAdmin);
    }
    function queueTransaction(bytes32 hash, uint256 eta) public onlyAdmin {
        require(getBlockTimestamp() + delay >= eta, "CompTimelock: ETA must be greater than or equal to the current block timestamp + delay");
        queuedTransactions[hash] = true;
        emit TransactionQueued(hash, eta);
    }
    function cancelTransaction(bytes32 hash) public onlyAdmin {
        queuedTransactions[hash] = false;
        emit TransactionCancelled(hash);
    }
    function executeTransaction(bytes32 hash, uint8 v, bytes32 r, bytes32 s) public {
        require(queuedTransactions[hash], "CompTimelock: hash does not correspond to a queued transaction");
        require(block.timestamp >= eta, "CompTimelock: ETA must be in the future");
        require(block.timestamp <= eta + gracePeriod, "CompTimelock: ETA must be within the grace period from the execution time");
        bytes32 txHash = keccak256(abi.encodePacked(address(this), hash));
        address signer = ecrecover(txHash, v, r, s);
        require(signer == admin, "CompTimelock: hash does not correspond to an admin account");
        queuedTransactions[hash] = false;
        (bool success, bytes memory returndata) = signer.call{
            gas: 100000,
            value: 0
        }(abi.encodePacked(hash));
        require(success, "CompTimelock: Transaction execution reverted");
        emit TransactionExecuted(hash);
    }
    function getBlockTimestamp() internal view returns (uint256) {
        return block.timestamp;
    }
}