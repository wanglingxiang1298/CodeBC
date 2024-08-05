pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1271/IERC1271.sol";

contract MyContract is IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bool) {
        // Implement your signature verification logic here
        // For example, you could use the ECDSA library to verify the signature
        // ECDSA.recover(hash, signature);
        return true;
    }
}