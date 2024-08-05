pragma solidity ^0.8.20;

contract CompTimelock {
    // Events
    event QueuedTransaction(address indexed _from, uint256 indexed _value, uint256 _eta);
    event CancelledTransaction(address indexed _from, uint256 indexed _value, uint256 _eta);
    event ExecutedTransaction(address indexed _from, uint256 indexed _value, uint256 _eta);

    // Constants
    uint256 public constant GRACE_PERIOD = 1 days;
    uint256 public constant DELAY_THRESHOLD = 1 hours;

    // Roles
    address public admin;
    address public pendingAdmin;

    // Transaction queue
    mapping(uint256 => Transaction) public transactionQueue;

    // Functions
    constructor() public {
        admin = msg.sender;
    }

    function setDelay(uint256 _delay) public {
        require(msg.sender == admin, "Only admin can set delay");
        DELAY_THRESHOLD = _delay;
    }

    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "Only pending admin can accept admin role");
        admin = pendingAdmin;
        pendingAdmin = address(0);
    }

    function setPendingAdmin(address _pendingAdmin) public {
        require(msg.sender == admin, "Only admin can set pending admin");
        pendingAdmin = _pendingAdmin;
    }

    function queueTransaction(address _to, uint256 _value, uint256 _eta) public {
        require(msg.sender == admin, "Only admin can queue transactions");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta <= block.timestamp + DELAY_THRESHOLD, "ETA must be within the delay threshold");
        transactionQueue[_eta] = Transaction(_to, _value, _eta);
        emit QueuedTransaction(msg.sender, _value, _eta);
    }

    function cancelTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can cancel transactions");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta <= block.timestamp + DELAY_THRESHOLD, "ETA must be within the delay threshold");
        delete transactionQueue[_eta];
        emit CancelledTransaction(msg.sender, _value, _eta);
    }

    function executeTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can execute transactions");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta <= block.timestamp + DELAY_THRESHOLD, "ETA must be within the delay threshold");
        Transaction memory transaction = transactionQueue[_eta];
        delete transactionQueue[_eta];
        transaction.to.call{value: transaction.value}("");
        emit ExecutedTransaction(msg.sender, transaction.value, transaction.eta);
    }

    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}
