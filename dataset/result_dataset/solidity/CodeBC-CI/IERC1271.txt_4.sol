pragma solidity ^0.8.20;
interface IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bool);
}
contract ERC1271 is IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view override returns (bool) {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature);
        return ecrecover(hash, v, r, s) == ecrecover(hash, 27, r, s);
    }
    function splitSignature(bytes memory sig) private pure returns (uint8 v, bytes32 r, bytes32 s) {
        require(sig.length == 65);
        (v, r, s) = (uint8(sig[0]), bytes32(bytes20(sig[1:])), bytes32(bytes32(sig[33:])));
        require(v == 27 || v == 28);
    }
}ure(bytes32 hash, bytes memory signature) public view override returns (bool) {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature);
        return ecrecover(hash, v, r, s) == ecrecover(hash, 27, r, s);
    }
    function splitSignature(bytes memory sig) private pure returns (uint8 v, bytes32 r, bytes32 s) {
        require(sig.length == 65);
        (v, r, s) = (uint8(sig[0]), bytes32(bytes20(sig[1:])), bytes32(bytes32(sig[33:])));
        require(v == 27 || v == 28);
    }
}