pragma solidity ^0.8.20;
import "./IERC20.sol";
contract CompTimelock {
    uint256 private constant MIN_DELAY = 3600; // 1 hour
    role Admin {
        uint256 private constant MIN_DELAY = 3600; // 1 hour
        address private constant admin;
        address private constant pendingAdmin;
    }
    IERC20 private token;
    mapping(uint256 => CompTimelock.Transaction) private transactions;
    event TransactionQueued(uint256 id, address sender, address recipient, uint256 amount, uint256 eta);
    event TransactionCancelled(uint256 id);
    event TransactionExecuted(uint256 id);
    struct Transaction {
        address payable sender;
        address payable recipient;
        uint256 amount;
        uint256 eta;
        uint256 id;
        bool executed;
    }
    constructor(IERC20 token) {
        token = token;
    }
    function setDelay(uint256 delay) public {
        DELAY_THRESHOLD = delay;
    }
    function acceptAdmin() public {
        Admin(admin).setDelay(DELAY_THRESHOLD);
        Admin(pendingAdmin).acceptAdmin();
    }
    function setPendingAdmin(address a) public {
        Admin(admin).setDelay(DELAY_THRESHOLD);
        Admin(pendingAdmin).setPendingAdmin(a);
    }
    function queueTransaction(address payable recipient, uint256 amount, uint256 eta) public {
        require(msg.sender == admin, "Unauthorized access!");
        require(amount > 0, "Amount must be greater than 0");
        require(eta > block.timestamp, "ETA must be in the future");
        require(eta > block.timestamp + MIN_DELAY, "ETA must be at least 1 hour in the future");
        uint256 id = transactions.length;
        Transaction memory transaction = Transaction({
            sender: msg.sender,
            recipient: recipient,
            amount: amount,
            eta: eta,
            id: id,
            executed: false
        });
        transactions[id] = transaction;
        emit TransactionQueued(id, msg.sender, recipient, amount, eta);
    }
    function cancelTransaction(uint256 id) public {
        require(msg.sender == admin, "Unauthorized access!");
        require(transactions[id].sender == msg.sender || transactions[id].recipient == msg.sender, "Unauthorized access!");
        require(!transactions[id].executed, "Transaction already executed");
        transactions[id].sender = address(0);
        transactions[id].recipient = address(0);
        transactions[id].amount = 0;
        transactions[id].eta = 0;
        transactions[id].id = 0;
        transactions[id].executed = true;
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint256 id) public {
        require(msg.sender == admin, "Unauthorized access!");
        require(transactions[id].sender == msg.sender || transactions[id].recipient == msg.sender, "Unauthorized access!");
        require(!transactions[id].executed, "Transaction already executed");
        require(block.timestamp >= transactions[id].eta - GRACE_PERIOD, "Transaction too soon");
        require(block.timestamp <= transactions[id].eta, "Transaction too late");
        transactions[id].sender.transfer(transactions[id].amount);
        transactions[id].sender = address(0);
        transactions[id].recipient = address(0);
        transactions[id].amount = 0;
        transactions[id].eta = 0;
        transactions[id].id = 0;
        transactions[id].executed = true;
        emit TransactionExecuted(id);
    }
    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
    function _executeTransaction(uint256 id) internal {
        require(transactions[id].sender == msg.sender || transactions[id].recipient == msg.sender, "Unauthorized access!");
        require(!transactions[id].executed, "Transaction already executed");
        require(block.timestamp >= transactions[id].eta - GRACE_PERIOD, "Transaction too soon");
        require(block.timestamp <= transactions[id].eta, "Transaction too late");
        transactions[id].sender.transfer(transactions[id].amount);
        transactions[id].sender = address(0);
        transactions[id].recipient = address(0);
        transactions[id].amount = 0;
        transactions[id].eta = 0;
        transactions[id].id = 0;
        transactions[id].executed = true;
        emit TransactionExecuted(id);
    }
    function _transfer(address payable recipient, uint256 amount) internal {
        require(amount > 0, "Amount must be greater than 0");
        require(msg.value >= amount, "Insufficient funds");
        recipient.transfer(amount);
    }
}