pragma solidity ^0.8.20;

interface IERC1967 {
    event Upgraded(address indexed implementation);
    event AdminChanged(address indexed previousAdmin, address indexed newAdmin);
    event BeaconUpgraded(address indexed beacon);

    function upgradeTo(address newImplementation) external;
    function changeAdmin(address newAdmin) external;
    function upgradeBeacon(address newBeacon) external;
}