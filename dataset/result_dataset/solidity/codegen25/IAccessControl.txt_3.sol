pragma solidity ^0.8.20;
interface IAccessControl {
    function hasRole(bytes32 role) bool virtual external;
    function getRoleAdmin(bytes32 role) bytes32 virtual external;
    function grantRole(bytes32 role, address account) virtual external;
    function revokeRole(bytes32 role, address account) virtual external;
    function renounceRole(bytes32 role, address account) virtual external;
}