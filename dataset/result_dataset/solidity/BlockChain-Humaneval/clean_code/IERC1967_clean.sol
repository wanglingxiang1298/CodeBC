pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed implementation);
    event AdminChanged(address previousAdmin, address newAdmin);
    event BeaconUpgraded(address indexed beacon);
}