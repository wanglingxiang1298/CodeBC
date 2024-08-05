pragma solidity ^0.8.20;
interface ICompoundTimelock {
    event NewAdmin(address indexed newAdmin);
    event NewPendingAdmin(address indexed newPendingAdmin);
    event NewDelay(uint256 indexed newDelay);
    event CancelTransaction(bytes32 indexed txHash, address indexed target, uint256 value);
    event ExecuteTransaction(bytes32 indexed txHash, address indexed target, uint256 value, bytes data);
    event QueueTransaction(bytes32 indexed txHash, address indexed target, uint256 value, bytes data, uint256 eta);
    function admin() external view returns (address);
    function pendingAdmin() external view returns (address);
    function delay() external view returns (uint256);
    function queuedTransactions(bytes32 hash) external view returns (bool);
    function setDelay(uint256 delay) external;
    function acceptAdmin() external;
    function setPendingAdmin(address newPendingAdmin) external;
    function queueTransaction(
        address target,
        uint256 value,
        bytes calldata data,
        uint256 eta
    ) external returns (bytes32);
    function cancelTransaction(address target, uint256 value, bytes calldata data, uint256 eta) external;
    function executeTransaction(address target, uint256 value, bytes calldata data, uint256 eta) external;
}
