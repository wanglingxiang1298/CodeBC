pragma solidity ^0.8.20;

interface ICompoundTimelock {
    event NewAdmin(address indexed _admin);
    event NewPendingAdmin(address indexed _pendingAdmin);
    event NewDelay(uint256 _delay);
    event CancelTransaction(uint256 indexed _transactionId);
    event ExecuteTransaction(uint256 indexed _transactionId);
    event QueueTransaction(uint256 indexed _transactionId);

    function receive() external payable;
    function GRACE_PERIOD() public view returns (uint256);
    function MINIMUM_DELAY() public view returns (uint256);
    function MAXIMUM_DELAY() public view returns (uint256);
    function admin() public view returns (address);
    function pendingAdmin() public view returns (address);
    function delay() public view returns (uint256);
    function queuedTransactions(uint256 _transactionId) public view returns (bool);
    function setDelay(uint256 _delay) public;
    function acceptAdmin() public;
    function setPendingAdmin(address _pendingAdmin) public;
    function queueTransaction(uint256 _transactionId) public;
    function cancelTransaction(uint256 _transactionId) public;
    function executeTransaction(uint256 _transactionId) public;
}