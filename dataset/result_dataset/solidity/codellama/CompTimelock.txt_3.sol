pragma solidity ^0.8.20;

contract CompTimelock {
    // Events
    event QueuedTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);
    event CancelledTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);
    event ExecutedTransaction(address indexed _from, uint256 indexed _value, uint256 indexed _eta);

    // Constants
    uint256 public constant GRACE_PERIOD = 100; // 100 blocks
    uint256 public constant DELAY_THRESHOLD = 10; // 10 blocks

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
        require(_delay > 0, "Delay must be greater than 0");
        delay = _delay;
    }

    function acceptAdmin() public {
        require(msg.sender == pendingAdmin, "Only pending admin can accept admin");
        admin = pendingAdmin;
        pendingAdmin = address(0);
    }

    function setPendingAdmin(address _pendingAdmin) public {
        require(msg.sender == admin, "Only admin can set pending admin");
        require(_pendingAdmin!= address(0), "Pending admin cannot be zero address");
        pendingAdmin = _pendingAdmin;
    }

    function queueTransaction(address _to, uint256 _value, uint256 _eta) public {
        require(msg.sender == admin, "Only admin can queue transaction");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta - block.timestamp >= delay, "ETA must be at least delay blocks in the future");
        transactions[_eta] = Transaction(_to, _value, _eta);
        emit QueuedTransaction(msg.sender, _value, _eta);
    }

    function cancelTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can cancel transaction");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta - block.timestamp < delay, "ETA must be within delay blocks of the current block");
        delete transactions[_eta];
        emit CancelledTransaction(msg.sender, _value, _eta);
    }

    function executeTransaction(uint256 _eta) public {
        require(msg.sender == admin, "Only admin can execute transaction");
        require(_eta > block.timestamp, "ETA must be in the future");
        require(_eta - block.timestamp < delay, "ETA must be within delay blocks of the current block");
        Transaction memory transaction = transactions[_eta];
        delete transactions[_eta];
        transaction.to.transfer(transaction.value);
        emit ExecutedTransaction(msg.sender, transaction.value, transaction.eta);
    }

    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
}