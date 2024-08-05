pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1822/IERC1822Proxiable.sol";

contract MyContract is IERC1822Proxiable {
    // Unique identifier of the proxy contract
    bytes32 private _uuid;

    // Constructor
    constructor() public {
        _uuid = keccak256(abi.encodePacked(address(this)));
    }

    // Returns the unique identifier of the proxy contract
    function proxiableUUID() external view returns (bytes32) {
        return _uuid;
    }
}