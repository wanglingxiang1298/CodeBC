pragma solidity ^0.8.20;
interface ICompoundTimelock {
    event NewAdmin(address indexed newAdmin);
    event NewPendingAdmin(address indexed newPendingAdmin);
    event NewDelay(uint256 indexed newDelay);
    event CancelTransaction(bytes32 indexed txHash, address indexed target, uint256 value);
    event ExecuteTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string signature, bytes data, uint256 gasWanted);
    event QueueTransaction(bytes32 indexed txHash, address indexed target, uint256 value, string signature, bytes data, uint256 gasWanted, uint256 eta);
    function receive() external payable;
    function GRACE_PERIOD() external view returns (uint256);
    function MINIMUM_DELAY() external view returns (uint256);
    function MAXIMUM_DELAY() external view returns (uint256);
    function admin() external view returns (address);
    function pendingAdmin() external view returns (address);
    function delay() external view returns (uint256);
    function queuedTransactions(bytes32 hash) external view returns (bool);
    function setDelay(uint256 delay) external;
    function acceptAdmin() external;
    function setPendingAdmin(address newPendingAdmin) external;
    function queueTransaction(address target, uint256 value, string memory signature, bytes memory data, uint256 gasWanted) external returns (bytes32);
    function cancelTransaction(bytes32 txHash) external;
    function executeTransaction(bytes32 txHash) external;
}

