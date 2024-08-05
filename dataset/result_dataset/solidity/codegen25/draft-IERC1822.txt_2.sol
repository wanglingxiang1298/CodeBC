pragma solidity ^ 0.8.20;
import "./IERC1822Proxiable.sol";
contract MyContract implements IERC1822Proxiable {
    uint public uuid;
    constructor() {
        uuid = generateUUID();
    }
    function generateUUID() public view returns (uint) {
        return uniqueIdentifier;
    }
    function() payable external {}
}