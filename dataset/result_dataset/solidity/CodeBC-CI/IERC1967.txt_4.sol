pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed implementation);
    event AdminChanged(address indexed newAdmin, address indexed oldAdmin);
    event BeaconUpgraded(address indexed beacon);
    function upgrade(address newImplementation) external;
    function changeAdmin(address newAdmin) external;
    function beaconUpgrade(address beacon) external;
}
