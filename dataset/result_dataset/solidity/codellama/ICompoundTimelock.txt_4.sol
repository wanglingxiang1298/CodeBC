pragma solidity ^0.8.20;

interface ICompoundTimelock {
    event NewAdmin(address indexed newAdmin);
    event NewPendingAdmin(address indexed newPendingAdmin);
    event NewDelay(uint256 indexed newDelay);
    event CancelTransaction(bytes32 indexed txHash);
    event ExecuteTransaction(bytes32 indexed txHash);
    event QueueTransaction(bytes32 indexed txHash);

    function receive() external payable;
    function GRACE_PERIOD() public view returns (uint256);
    function MINIMUM_DELAY() public view returns (uint256);
    function MAXIMUM_DELAY() public view returns (uint256);
    function admin() public view returns (address);
    function pendingAdmin() public view returns (address);
    function delay() public view returns (uint256);
    function queuedTransactions(bytes32 txHash) public view returns (bool);
    function setDelay(uint256 newDelay) public;
    function acceptAdmin() public;
    function setPendingAdmin(address newPendingAdmin) public;
    function queueTransaction(bytes32 txHash) public;
    function cancelTransaction(bytes32 txHash) public;
    function executeTransaction(bytes32 txHash) public;
}