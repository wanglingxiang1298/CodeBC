pragma solidity ^0.8.20;
interface IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view returns (bool);
}
contract ERC1271 is IERC1271 {
    function isValidSignature(bytes32 hash, bytes memory signature) public view override returns (bool) {
        (uint8 v, bytes32 r, bytes32 s) = splitSignature(signature);
        return ecrecover(hash, v, r, s) == ecrecover(hash, 27, r, s);
    }
    function splitSignature(bytes memory sig) internal pure returns (uint8 v, bytes32 r, bytes32 s) {
        require(sig.length == 65, "INVALID_SIGNATURE_LENGTH");
        assembly {
            let sigindex := 0x40
            let siglen := mload(0x40)
            sigindex := add(sigindex, 0x20)
            siglen := sub(siglen, 0x20)
            let v := byte(0, mload(add(sig, 0x20)))
            let r := mload(add(sig, 0x40))
            let s := mload(add(sig, 0x60))
            v := and(v, 0xff)
            r := div(r, exp(0x100, sub(0x80, v)))
            s := div(s, exp(0x100, sub(0x80, v)))
            r := udiv(r, 0x1000000000000000000000000000000000000000000000000000000000000000)
            s := udiv(s, 0x1000000000000000000000000000000000000000000000000000000000000000)
        }
        return (v, r, s);
    }
}