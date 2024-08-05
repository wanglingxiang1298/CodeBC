pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed from, address indexed to);
    event AdminChanged(address indexed from, address indexed to);
    event BeaconUpgraded(address indexed from, address indexed to);
    function upgrade(address to_) external;
    function setAdmin(address admin_) external;
    function setBeacon(address beacon_) external;
    function admin() external view returns (address);
    function beacon() external view returns (address);
}