pragma solidity ^0.8.20;

import "IERC1967.sol";

contract MyContract is IERC1967 {
    event Upgraded(address indexed _from, address indexed _to);
    event AdminChanged(address indexed _from, address indexed _to);
    event BeaconUpgraded(address indexed _from, address indexed _to);

    //...
}