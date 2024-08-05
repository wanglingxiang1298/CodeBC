pragma solidity ^0.8.20;

interface IAccessControl {
    function hasRole(address account, bytes32 role) external view returns (bool);
    function getRoleAdmin(bytes32 role) external view returns (bytes32);
    function grantRole(address account, bytes32 role) external;
    function revokeRole(address account, bytes32 role) external;
    function renounceRole(address account, bytes32 role) external;

    event RoleAdminChanged(bytes32 indexed role, bytes32 indexed previousAdminRole, bytes32 indexed newAdminRole);
    event RoleGranted(address indexed account, bytes32 indexed role, bytes32 indexed sender);
    event RoleRevoked(address indexed account, bytes32 indexed role, bytes32 indexed sender);
}