pragma solidity ^0.8.20;
interface IAccessControl {
    bool hasRole(address _role, address _account) external view;
    bytes32 getRoleAdmin(address _role) external view;
    function grantRole(address _role, address _account) external onlyOwner {
        require(msg.sender == owner || hasRole(ACCESS_CONTROL_ROLES, msg.sender) || msg.sender == owner);
        _grantRole(_role, _account);
    }
    function revokeRole(address _role, address _account) external onlyOwner {
        require(msg.sender == owner || hasRole(ACCESS_CONTROL_ROLES, msg.sender) || msg.sender == owner);
        _revokeRole(_role, _account);
    }
    event RoleGranted(address indexed _role, address indexed _account);
    event RoleRevoked(address indexed _role, address indexed _account);
    event RoleAdminChanged(address indexed _previousAdmin, address indexed _newAdmin);
}