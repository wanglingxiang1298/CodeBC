pragma solidity ^0.8.20;
interface IAccessControl {
    function hasRole(bytes32 role) bool virtual;
    function getRoleAdmin(bytes32 role) virtual;
    function grantRole(bytes32 role, address account) virtual;
    function revokeRole(bytes32 role, address account) virtual;
    function renounceRole(bytes32 role) virtual;
}