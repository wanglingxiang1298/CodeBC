pragma solidity ^0.8.20;
interface IERC1271 {
    bool isValidSignature(bytes32 hash, bytes32 signature);
}