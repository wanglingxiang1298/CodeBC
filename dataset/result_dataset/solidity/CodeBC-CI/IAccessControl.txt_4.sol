pragma solidity ^0.8.20;
contract AccessControl {
    mapping(address => uint256) private _roles;
    mapping(address => uint256) private _adminRoles;
    event RoleAdminChanged(address indexed role, address indexed newAdminRole);
    event RoleGranted(address indexed role, address indexed account);
    event RoleRevoked(address indexed role, address indexed account);
    modifier onlyRole(string memory role) {
        require(hasRole(msg.sender, role), "AccessControl: must have role");
        _;
    }
    function hasRole(address account, string memory role) public view returns (bool) {
        uint256 accountRole = uint256(keccak256(abi.encodePacked(role)));
        return (accountRole & _roles[account])!= 0;
    }
    function getRoleAdmin(string memory role) public view returns (address) {
        return _adminRoles[role];
    }
    function grantRole(address account, string memory role) public onlyRole(role) {
        _grantRole(role, account);
    }
    function revokeRole(address account, string memory role) public onlyRole(role) {
        _revokeRole(role, account);
    }
    function renounceRole(string memory role, address account) public {
        require(account == msg.sender, "AccessControl: can only renounce roles for self");
        _revokeRole(role, account);
    }
    function _setRoleAdmin(string memory role, address account) internal {
        require(account!= address(0), "AccessControl:leAdminChanged(role, account);
    }
    function _revokeRole(string memory role, address account) internal {
        require(account!= address(0), "AccessControl: account is zero address");
        uint256 accountRole = uint256(keccak256(abi.encodePacked(role)));
        require((accountRole & _roles[account])!= 0, "AccessControl: account does not have role");
        _roles[account] &= ~accountRole;
        emit RoleRevoked(role, account);
    }
}

