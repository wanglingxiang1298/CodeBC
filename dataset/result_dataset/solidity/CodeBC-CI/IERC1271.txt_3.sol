pragma solidity ^0.8.20;
interface IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bool);
}
contract ERC1271 is IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view override returns (bool) {
        (uint8 v, bytes32 r, bytes32 s) = abi.decode(signature, (uint8, bytes32, bytes32));
        return ecrecover(hash, v, r, s) == ecrecover(hash, 27, r, s);
    }
}
