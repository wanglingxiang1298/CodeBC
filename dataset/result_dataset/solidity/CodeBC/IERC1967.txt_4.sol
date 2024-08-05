pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed from, address indexed to);
    event AdminChanged(address indexed from, address indexed to);
    event BeaconUpgraded(address indexed from, address indexed to);
    function upgrade(address to_) external;
    function getAdmin() external view returns (address);
    function setAdmin(address newAdmin_) external;
    function getBeacon() external view returns (address);
    function setBeacon(address newBeacon_) external;
}

