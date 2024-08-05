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
        require(sig.length == 65, "INVALID_SIGNATURE_LENGTH");
        assembly {
            let sigindex := 0x04
            let v := byte(0, sig[sigindex])
            let r := shr(0x20, sig[sigindex + 0x01])
            let s := and(sig[sigindex + 0x02], 0xff)
            r := or(r, shl(0x20, r))
            s := or(s, shl(0x20, s))
            v := add(and(v, 0x10), shl(0x04, gt(r, 0x7FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)))
        }
        return (v, r, s);
    }
}
