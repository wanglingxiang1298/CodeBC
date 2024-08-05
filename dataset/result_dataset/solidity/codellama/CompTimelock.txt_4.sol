pragma solidity ^0.8.20;

contract CompTimelock {
    // Events
    event QueueTransaction(address indexed _from, uint256 indexed _eta);
    event CancelTransaction(address indexed _from, uint256 indexed _eta);
    event ExecuteTransaction(address indexed _from, uint256 indexed _eta);

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
        require(msg.sender == admin, "Only admin can set delay");
        DELAY_THRESHOLD = _delay;
    }

    function acceptAdmin() public {
        require(msg.sender == admin, "Only admin can accept admin");
        pendingAdmin = msg.sender;
    }

    function setPendingAdmin(address _pendingAdmin) public {
        require(msg.sender == admin, "Only admin can set pending admin");
        pendingAdmin = _pendingAdmin;
    }

    function queueTransaction(address _to, uint256 _value, uint256 _eta) public {
        require(msg.sender == admin, "Only admin can queue transaction");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta < block.timestamp + GRACE_PERIOD, "ETA must be within the grace period");
        transactions[_eta] = Transaction({
            to: _to,
            value: _value,
            eta: _eta
        });
        emit QueueTransaction(msg.sender, _eta);
    }

    function cancelTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can cancel transaction");
        require(transactions[_eta].to!= address(0), "Transaction does not exist");
        delete transactions[_eta];
        emit CancelTransaction(msg.sender, _eta);
    }

    function executeTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can execute transaction");
        require(transactions[_eta].to!= address(0), "Transaction does not exist");
        require(_eta < block.timestamp + GRACE_PERIOD, "ETA must be within the grace period");
        transactions[_eta].to.transfer(transactions[_eta].value);
        delete transactions[_eta];
        emit ExecuteTransaction(msg.sender, _eta);
    }

    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}