pragma solidity ^0.8.20;
contract AccessControl {
    mapping(address => uint256) private _roles;
    mapping(uint256 => address) private _admins;
    event RoleAdminChanged(uint256 indexed role, address indexed previousAdmin, address indexed newAdmin);
    event RoleGranted(uint256 indexed role, address indexed account);
    event RoleRevoked(uint256 indexed role, address indexed account);
    modifier onlyRole(uint256 role) {
        require(isRole(msg.sender, role));
        _;
    }
    function hasRole(address account, uint256 role) public view returns (bool) {
        return isRole(account, role);
    }
    function getRoleAdmin(uint256 role) public view returns (address) {
        return _admins[role];
    }
    function grantRole(address account, uint256 role) public onlyRole(role) {
        _grantRole(role, account);
    }
    function revokeRole(address account, uint256 role) public onlyRole(role) {
        _revokeRole(role, account);
    }
    function renounceRole(uint256 role, address account) public {
        require(account == msg.sender);
        _revokeRole(role, account);
    }
    function isRole(address account, uint256 role) public view returns (bool) {
        return _roles[account] & role == role;
    }
    function _setRoleAdmin(uint256 role, address account) internal {
        require(account!= address(0));
        _admins[role] = account;
    }
    function _grantRole(uint256 role, address account) internal {
        require(account!= address(0));
        _roles[account] |= role;
        emit RoleGranted(role, account);
    }
    function _revokeRole(uint256 role, address account) internal {
        require(account!= address(0));
        _roles[account] &= ~role;
        emit RoleRevoked(role, account);
    }
}
