pragma solidity ^ 0.8.20;
interface IERC1967 {
    event Upgraded(address newImplementation);
    event AdminChanged(address previousAdmin, address newAdmin);
    event BeaconUpgraded(address newBeacon);
}