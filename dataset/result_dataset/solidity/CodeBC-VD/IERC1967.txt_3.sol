pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed implementation);
    event AdminChanged(address previousAdmin, address newAdmin);
    event BeaconUpgraded(address previousBeacon, address newBeacon);
    function implementation() external view returns (address);
    function admin() external view returns (address);
    function beacon() external view returns (address);
    function setImplementation(address newImplementation) external;
    function upgrade(bytes memory data) external returns (bool);
    function upgrade(bytes memory data) external payable;
    function setAdmin(address newAdmin) external;
    function setBeacon(address newBeacon) external;
    function upgradeToAndCall(address newImplementation, bytes memory data) external payable returns (bool);
}