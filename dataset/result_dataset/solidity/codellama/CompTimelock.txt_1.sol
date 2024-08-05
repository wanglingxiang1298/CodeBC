pragma solidity ^0.8.20;

contract CompTimelock {
    // Events
    event QueuedTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);
    event CancelledTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);
    event ExecutedTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);

    // Constants
    uint256 public constant GRACE_PERIOD = 1 days;
    uint256 public constant DELAY_THRESHOLD = 1 hours;

    // Admin and pending admin roles
    address public admin;
    address public pendingAdmin;

    // Transaction queue
    mapping(uint256 => Transaction) public transactions;

    // Functions
    constructor() public {
        admin = msg.sender;
    }

    function setDelay(uint256 _delay) public {
        require(msg.sender == admin, "Only the admin can set the delay");
        DELAY_THRESHOLD = _delay;
    }

    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "Only the pending admin can accept the admin role");
        admin = pendingAdmin;
        pendingAdmin = address(0);
    }

    function setPendingAdmin(address _pendingAdmin) public {
        require(msg.sender == admin, "Only the admin can set the pending admin");
        pendingAdmin = _pendingAdmin;
    }

    function queueTransaction(address _to, uint256 _value, uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can queue transactions");
        require(_eta > block.timestamp, "The eta must be in the future");
        require(_eta < block.timestamp + GRACE_PERIOD, "The eta must be within the grace period");
        transactions[_eta] = Transaction(_to, _value, _eta);
        emit QueuedTransaction(msg.sender, _value, _eta);
    }

    function cancelTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can cancel transactions");
        require(_eta > block.timestamp, "The eta must be in the future");
        require(_eta < block.timestamp + GRACE_PERIOD, "The eta must be within the grace period");
        delete transactions[_eta];
        emit CancelledTransaction(msg.sender, _value, _eta);
    }

    function executeTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can execute transactions");
        require(_eta > block.timestamp, "The eta must be in the future");
        require(_eta < block.timestamp + GRACE_PERIOD, "The eta must be within the grace period");
        Transaction memory transaction = transactions[_eta];
        delete transactions[_eta];
        transaction.to.transfer(transaction.value);
        emit ExecutedTransaction(msg.sender, transaction.value, transaction.eta);
    }

    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}
