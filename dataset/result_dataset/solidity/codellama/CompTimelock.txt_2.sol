pragma solidity ^0.8.20;

contract CompTimelock {
    // Events
    event QueuedTransaction(address indexed _from, address indexed _to, uint256 _value, uint256 _eta);
    event CancelledTransaction(address indexed _from, address indexed _to, uint256 _value, uint256 _eta);
    event ExecutedTransaction(address indexed _from, address indexed _to, uint256 _value, uint256 _eta);

    // Constants
    uint256 public constant GRACE_PERIOD = 100; // 100 blocks
    uint256 public constant DELAY_THRESHOLD = 10; // 10 blocks

    // Roles
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
        require(_delay >= DELAY_THRESHOLD, "Delay must be greater than or equal to DELAY_THRESHOLD");
        delay = _delay;
    }

    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "Only the pending admin can accept admin rights");
        admin = pendingAdmin;
        pendingAdmin = address(0);
    }

    function setPendingAdmin(address _pendingAdmin) public {
        require(msg.sender == admin, "Only the admin can set the pending admin");
        pendingAdmin = _pendingAdmin;
    }

    function queueTransaction(address _to, uint256 _value, uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can queue transactions");
        require(_eta > block.timestamp, "ETA must be greater than the current block timestamp");
        require(_eta <= block.timestamp + GRACE_PERIOD, "ETA must be within the grace period window");
        transactions[_eta] = Transaction(_to, _value, _eta);
        emit QueuedTransaction(msg.sender, _to, _value, _eta);
    }

    function cancelTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can cancel transactions");
        require(_eta > block.timestamp, "ETA must be greater than the current block timestamp");
        require(_eta <= block.timestamp + GRACE_PERIOD, "ETA must be within the grace period window");
        delete transactions[_eta];
        emit CancelledTransaction(msg.sender, _to, _value, _eta);
    }

    function executeTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only the admin can execute transactions");
        require(_eta > block.timestamp, "ETA must be greater than the current block timestamp");
        require(_eta <= block.timestamp + GRACE_PERIOD, "ETA must be within the grace period window");
        Transaction memory transaction = transactions[_eta];
        delete transactions[_eta];
        emit ExecutedTransaction(msg.sender, transaction.to, transaction.value, transaction.eta);
    }

    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}