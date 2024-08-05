pragma solidity ^0.8.20;

import "./IERC1967.sol";

contract MyContract is IERC1967 {
    event Upgraded(address indexed _from, address indexed _to);
    event AdminChanged(address indexed _oldAdmin, address indexed _newAdmin);
    event BeaconUpgraded(address indexed _beacon);

    address private _admin;
    address private _beacon;

    constructor() public {
        _admin = msg.sender;
        _beacon = address(0);
    }

    function upgrade(address _newBeacon) public {
        require(msg.sender == _admin, "Only the admin can upgrade the contract");
        _beacon = _newBeacon;
        emit BeaconUpgraded(_beacon);
    }

    function changeAdmin(address _newAdmin) public {
        require(msg.sender == _admin, "Only the admin can change the admin");
        _admin = _newAdmin;
        emit AdminChanged(_admin);
    }

    function getAdmin() public view returns (address) {
        return _admin;
    }

    function getBeacon() public view returns (address) {
        return _beacon;
    }
}