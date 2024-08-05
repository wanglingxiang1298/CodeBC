pragma solidity ^0.8.20;
interface ICompoundTimelock {
    event NewAdmin(address indexed newAdmin);
    event NewPendingAdmin(address indexed newPendingAdmin);
    event NewDelay(uint256 indexed newDelay);
    event CancelTransaction(
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );
    event ExecuteTransaction(
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );
    event QueueTransaction(
        bytes32 indexed txHash,
        address indexed target,
        uint256 value,
        string signature,
        bytes data,
        uint256 eta
    );
    receive() external payable;
    function GRACE_PERIOD() external view returns (uint256);
    function MINIMUM_DELAY() external view returns (uint256);
    function MAXIMUM_DELAY() external view returns (uint256);
    function admin() external view returns (address);
    function pendingAdmin() external view returns (address);
    function delay() external view returns (uint256);
    function queuedTransactions(bytes32) external view returns (bool);
    function setDelay(uint256) external;
    function acceptAdmin() external;
    function setPendingAdmin(address) external;
    function queueTransaction(
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) external returns (bytes32);
    function cancelTransaction(
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) external;
    function executeTransaction(
        address target,
        uint256 value,
        string memory signature,
        bytes memory data,
        uint256 eta
    ) external payable returns (bytes memory);
}