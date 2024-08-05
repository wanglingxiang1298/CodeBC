pragma solidity ^0.8.20;
interface IERC1967 {
    event Upgraded(address indexed from, address indexed to);
    event AdminChanged(address indexed from, address indexed to);
    event BeaconUpgraded(address indexed from, address indexed to);
    function upgrade(address to_) external;
    function setAdmin(address admin_) external;
    function beacon() external view returns (address);
    function implementation() external view returns (address);
    function admin() external view returns (address);
    function upgradeTo(address newImplementation) external;
    function upgradeToAndCall(address newImplementation, bytes calldata data) external payable;
    function adminImpl() external;
}

