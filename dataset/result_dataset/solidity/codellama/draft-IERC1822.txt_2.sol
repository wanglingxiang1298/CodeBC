pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1822/IERC1822Proxiable.sol";

contract MyContract is IERC1822Proxiable {
    // Unique identifier of the proxy contract
    bytes32 public proxiableUUID;

    constructor() public {
        proxiableUUID = keccak256(abi.encodePacked(address(this)));
    }

    function proxiableUUID() external view returns (bytes32) {
        return proxiableUUID;
    }
}