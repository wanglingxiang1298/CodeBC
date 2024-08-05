pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed from, address indexed to);
    event AdminChanged(address indexed from, address indexed to);
    event BeaconUpgraded(address indexed from, address indexed to);
}