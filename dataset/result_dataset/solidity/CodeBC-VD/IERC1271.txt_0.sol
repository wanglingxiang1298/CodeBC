pragma solidity ^0.8.20;
interface IERC1271 {
    function isValidSignature(bytes32 _hash, bytes memory _signature) external view returns (bool isValid);
}
