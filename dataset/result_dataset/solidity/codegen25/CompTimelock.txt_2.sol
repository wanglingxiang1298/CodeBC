pragma solidity ^0.8.20;
import "./IERC20.sol";
import "./Roles.sol";
contract CompTimelock {
    uint256 private constant DELAY_THRESHOLD = 30 days;
    uint256 private constant GRACE_PERIOD = 7 days;
    event TransactionQueued(uint256 id, address sender, address recipient, uint256 value, uint256 eta);
    event TransactionCancelled(uint256 id);
    event TransactionExecuted(uint256 id);
    role Admin {
        acceptAdmin() external onlyAdmin();
        setPendingAdmin(address) external onlyPendingAdmin();
    }
    role PendingAdmin {
        setAdmin(address) external onlyPendingAdmin();
    }
    address private constant admin;
    address private constant pendingAdmin;
    mapping(uint256 => Transaction) private transactionalQueue;
    struct Transaction {
        address payable sender;
        address payable recipient;
        uint256 value;
        uint256 eta;
    }
    constructor() {
        admin = msg.sender;
        pendingAdmin = msg.sender;
    }
    function setDelay(uint256 delay) external onlyAdmin() {
        DELAY_THRESHOLD = delay;
    }
    function acceptAdmin() external onlyPendingAdmin() {
        pendingAdmin = msg.sender;
        Role.grantAdmin(admin, {from: admin});
        Role.grantPendingAdmin(pendingAdmin, {from: admin});
    }
    function setPendingAdmin(address newAdmin) external onlyAdmin() {
        Role.grantPendingAdmin(newAdmin, {from: admin});
        Role.grantAdmin(pendingAdmin, {from: admin});
        pendingAdmin = newAdmin;
    }
    function queueTransaction(address payable sender, address payable recipient, uint256 value, uint256 eta) external onlyAdmin() {
        if (transactionalQueue[sender.address].sender != address(0)) {
            revert("Transaction already queued.");
        }
        if (IERC20(sender).balanceOf(msg.sender) < value) {
            revert("Insufficient funds.");
        }
        uint256 newId = transactionalQueue.length;
        transactionalQueue[newId] = Transaction({
            sender: sender,
            recipient: recipient,
            value: value,
            eta: eta
        });
        emit TransactionQueued(newId, sender, recipient, value, eta);
    }
    function cancelTransaction(uint256 id) external onlyAdmin() {
        if (transactionalQueue[id] == Transaction({
            sender: address(0),
            recipient: address(0),
            value: 0,
            eta: 0
        }) && IERC20(admin).balanceOf(admin) == 0) {
            revert("Cannot cancel transaction because it has already been executed.");
        }
        transactionalQueue[id] = Transaction({
            sender: address(0),
            recipient: address(0),
            value: 0,
            eta: 0
        });
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint256 id) external onlyAdmin() {
        if (transactionalQueue[id] == Transaction({
            sender: address(0),
            recipient: address(0),
            value: 0,
            eta: 0
        })) {
            revert("Transaction does not exist.");
        }
        if (transactionalQueue[id].sender != address(0)) {
            revert("Transaction has already been executed.");
        }
        if (IERC20(transactionalQueue[id].sender).balanceOf(msg.sender) < transactionalQueue[id].value) {
            revert("Insufficient funds.");
        }
        if (getBlockTimestamp() < transactionalQueue[id].eta + DELAY_THRESHOLD) {
            revert("Transaction not yet ready.");
        }
        if (IERC20(transactionalQueue[id].sender).balanceOf(msg.sender) < transactionalQueue[id].value) {
            revert("Insufficient funds.");
        }
        IERC20(transactionalQueue[id].sender).transfer(transactionalQueue[id].recipient, transactionalQueue[id].value, {from: transactionalQueue[id].sender});
        transactionalQueue[id] = Transaction({
            sender: address(0),
            recipient: address(0),
            value: 0,
            eta: 0
        });
        emit TransactionExecuted(id);
    }
    function getBlockTimestamp() private view returns (uint256) {
        return block.timestamp;
    }
}