pragma solidity ^0.8.20;
interface ICompoundTimelock {
    event NewAdmin(address indexed newAdmin);
    event NewPendingAdmin(address indexed newPendingAdmin);
    event NewDelay(uint256 indexed newDelay);
    event CancelTransaction(uint256 indexed transactionId);
    event ExecuteTransaction(uint256 indexed transactionId);
    event QueueTransaction(uint256 indexed transactionId);
    function receive() external payable;
    function GRACE_PERIOD() public view returns (uint256);
    function MINIMUM_DELAY() public view returns (uint256);
    function MAXIMUM_DELAY() public view returns (uint256);
    function admin() public view returns (address);
    function pendingAdmin() public view returns (address);
    function delay() public view returns (uint256);
    function queuedTransactions(uint256 transactionId) public view returns (bool);
    function setDelay(uint256 delay_) public;
    function acceptAdmin() public;
    function setPendingAdmin(address pendingAdmin_) public;
    function queueTransaction(uint256 transactionId) public;
    function cancelTransaction(uint256 transactionId) public;
    function executeTransaction(uint256 transactionId) public;
}