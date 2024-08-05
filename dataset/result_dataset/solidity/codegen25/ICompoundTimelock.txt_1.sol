pragma solidity ^0.8.20;
interface ICompoundTimelock {
    event NewAdmin(address);
    event NewPendingAdmin(address);
    event NewDelay(uint256);
    event CancelTransaction(bytes32);
    event ExecuteTransaction(bytes32);
    event QueueTransaction(bytes32);
    function receive() external payable;
    function GRACE_PERIOD() public view returns (uint256);
    function MINIMUM_DELAY() public view returns (uint256);
    function MAXIMUM_DELAY() public view returns (uint256);
    function admin() public view returns (address);
    function pendingAdmin() public view returns (address);
    function delay() public view returns (uint256);
    function queuedTransactions(bytes32) public view returns (bool);
    function setDelay(uint256 delay) public;
    function acceptAdmin() public;
    function setPendingAdmin(address) public;
    function queueTransaction(bytes32) public;
    function cancelTransaction(bytes32) public;
    function executeTransaction(bytes32) public;
}