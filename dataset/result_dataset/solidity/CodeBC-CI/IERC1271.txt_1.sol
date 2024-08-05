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
        assembly {
            let sigindex := 4
            v := byte(0, sig[sigindex])
            r := mload(add(sig, 34))
            s := mload(add(sig, 66))
        }
        return (v, r, s);
    }
}
