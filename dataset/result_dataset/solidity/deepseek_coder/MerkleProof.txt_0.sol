pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleProofVerifier {
    using(MerkleProof = "0x1234567890abcdef1234567890abcdef12345678");
    function verify(bytes32[] memory proof, bytes32 root) public pure returns (bool) {
        return MerkleProof.verify(proof, root);
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root) public view returns (bool) {
        return MerkleProof.verify(proof, root);
    }
    function processProof(bytes32[] memory proof, bytes32 leaf) public pure returns (bytes32) {
        return MerkleProof.processProof(proof, leaf);
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 leaf) public view returns (bytes32) {
        return MerkleProof.processProof(proof, leaf);
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32 leaf) public pure returns (bool) {
        return MerkleProof.multiProofVerify(proofs, proofFlags, roots, leaf);
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32 leaf) public view returns (bool) {
        return MerkleProof.multiProofVerify(proofs, proofFlags, roots, leaf);
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32 leaf) public pure returns (bytes32) {
        return MerkleProof.processMultiProof(proofs, proofFlags, roots, leaf);
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32 leaf) public view returns (bytes32) {
        return MerkleProof.processMultiProof(proofs, proofFlags, roots, leaf);
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return MerkleProof._hashPair(a, b);
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return MerkleProof._efficientHash(a, b);
    }
}