pragma solidity ^0.8.20;

interface IERC1967 {
    event Upgraded(address indexed newContract);
    event AdminChanged(address indexed newAdmin);
    event BeaconUpgraded(address indexed newBeacon);

    function upgrade(address newContract) external;
    function changeAdmin(address newAdmin) external;
    function upgradeBeacon(address newBeacon) external;
}
