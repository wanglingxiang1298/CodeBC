solidity^0.8.20
interface IERC1271 {
    function isValidSignature(bytes32 hash, bytes32 signature) external view returns (bool);
}