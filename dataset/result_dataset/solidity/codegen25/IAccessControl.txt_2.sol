pragma solidity ^0.8.20;
interface IAccessControl {
    function hasRole(bytes32 role) bool virtual external returns (bool);
    function getRoleAdmin(bytes32 role) virtual external returns (bytes32);
    function grantRole(bytes32 role, address account) virtual external returns (bool);
    function revokeRole(bytes32 role, address account) virtual external returns (bool);
    function renounceRole() virtual external returns (bytes32);
}