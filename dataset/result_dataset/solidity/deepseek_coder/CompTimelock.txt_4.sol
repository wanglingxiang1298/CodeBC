pragma solidity ^0.8.20;
import "./IERC20.sol";
import "./ILock.sol";
contract CompTimelock is IERC20, ILock {
    mapping(address => uint) private delayPeriods;
    mapping(address => uint) private etas;
    mapping(address => bool) private adminRoles;
    mapping(address => bool) private pendingAdminRoles;
    mapping(uint => Transaction) private transactionQueues;
    struct Transaction {
        address payable sender;
        address payable recipient;
        uint256 amount;
        uint256 eta;
        uint256 timestamp;
    }
    event TransactionQueued(uint256 id, address sender, address recipient, uint256 amount, uint256 eta);
    event TransactionCancelled(uint256 id);
    event TransactionExecuted(uint256 id);
    event GracePeriodExtended(uint delayPeriod);
    event DelayIncreased(uint delayPeriod);
    event DelayDecreased(uint delayPeriod);
    event AdminTransferred(address from, address to);
    event PendingAdminTransferred(address from, address to);
    function CompTimelock(uint initialDelay) ERC20("CompTimelock Token", "CTT") {
        delayPeriods[msg.sender] = initialDelay;
        adminRoles[msg.sender] = true;
        emit AdminTransferred(msg.sender, this);
    }
    function setDelay(uint newDelay) external onlyAdmin() {
        require(MIN_DELAY <= newDelay && newDelay <= MAX_DELAY, "CompTimelock: Delay must be between 1 and 5 days");
        delayPeriods[msg.sender] = newDelay;
        emit DelayIncreased(newDelay);
    }
    function acceptAdmin() external onlyPendingAdmin() {
        pendingAdminRoles[msg.sender] = false;
        adminRoles[msg.sender] = true;
        emit AdminTransferred(msg.sender, this);
    }
    function setPendingAdmin(address newPendingAdmin) external onlyAdmin() {
        require(newPendingAdmin != address(0), "CompTimelock: Cannot set pending admin to zero address");
        pendingAdminRoles[newPendingAdmin] = true;
        emit PendingAdminTransferred(msg.sender, newPendingAdmin);
    }
    function queueTransaction(address payable recipient, uint256 amount, uint256 eta) external onlyAdmin() {
        require(recipient != address(0), "CompTimelock: Cannot send to zero address");
        require(amount > 0, "CompTimelock: Amount must be greater than zero");
        require(eta > block.timestamp, "CompTimelock: ETAs must be in the future");
        uint newId = transactionQueues[block.number].length + 1;
        Transaction newTransaction = Transaction({
            sender: payable(msg.sender),
            recipient: recipient,
            amount: amount,
            eta: eta,
            timestamp: block.timestamp
        });
        transactionQueues[block.number][newId] = newTransaction;
        emit TransactionQueued(newId, newTransaction.sender, newTransaction.recipient, newTransaction.amount, newTransaction.eta);
    }
    function cancelTransaction(uint256 id) external onlyAdmin() {
        require(transactionQueues[block.number][id].sender == msg.sender, "CompTimelock: Only sender can cancel their own transaction");
        delete transactionQueues[block.number][id];
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint256 id) external onlyAdmin() {
        require(transactionQueues[block.number][id].sender == msg.sender || hasAdminRole(transactionQueues[block.number][id].sender), "CompTimelock: Only sender or admin can execute transaction");
        uint currentBlock = block.number;
        uint currentTimestamp = block.timestamp;
        Transaction transaction = transactionQueues[currentBlock][id];
        require(transaction.eta <= currentTimestamp + GRACE_PERIOD + delayPeriods[transaction.sender], "CompTimelock: Transaction has not reached delay threshold");
        require(transaction.eta <= currentTimestamp + GRACE_PERIOD + DELAY_THRESHOLD, "CompTimelock: Transaction has not reached delay threshold");
        _transfer(transaction.sender, transaction.recipient, transaction.amount);
        emit TransactionExecuted(id);
    }
    function getBlockTimestamp(uint256 blockNumber) private view returns (uint) {
        while (block.number >= blockNumber) {
            block.difficulty;
        }
        return block.timestamp;
    }
    modifier onlyAdmin() {
        require(adminRoles[msg.sender] || pendingAdminRoles[msg.sender], "CompTimelock: Caller is not admin or pending admin");
        _;
    }
    modifier onlyPendingAdmin() {
        require(pendingAdminRoles[msg.sender], "CompTimelock: Caller is not pending admin");
        _;
    }
}