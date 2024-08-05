pragma solidity ^0.8.20;
interface IAccessControl {
    function hasRole(bytes32 role) returns (bool);
    function getRoleAdmin(bytes32 role) returns (bytes32);
    function grantRole(bytes32 role, address account) returns (bool);
    function revokeRole(bytes32 role, address account) returns (bool);
    function renounceRole() returns (bytes32);
}