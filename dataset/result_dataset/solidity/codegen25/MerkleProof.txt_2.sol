pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleProofVerifier {
    using(MerkleProof = "0x1234567890123456789012345678901234567890");
    function verify(bytes32[] memory proofs, bytes32 root) public pure returns (bool) {
        return MerkleProof.verify(proofs, root);
    }
    function verifyCalldata(bytes32[] memory proofs, bytes32 root) public view returns (bool) {
        return MerkleProof.verify(proofs, root);
    }
    function processProof(bytes32[] memory proofs, bytes32 leaf) public view returns (bytes32) {
        return MerkleProof.processProof(proofs, leaf);
    }
    function processProofCalldata(bytes32[] memory proofs, bytes32 leaf) public view returns (bytes32) {
        return MerkleProof.processProof(proofs, leaf);
    }
    function multiProofVerify(bytes32[] memory proofs, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32 leaf) public view returns (bool) {
        return MerkleProof.multiProofVerify(proofs, proofFlags, rootHashes, leaf);
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32 leaf) public view returns (bool) {
        return MerkleProof.multiProofVerify(proofs, proofFlags, rootHashes, leaf);
    }
    function processMultiProof(bytes32[] memory proofs, uint256[] memory proofFlags, bytes32[] memory leafHashes) public view returns (bytes32) {
        return MerkleProof.processMultiProof(proofs, proofFlags, leafHashes);
    }
    function processMultiProofCalldata(bytes32[] memory proofs, uint256[] memory proofFlags, bytes32[] memory leafHashes) public view returns (bytes32) {
        return MerkleProof.processMultiProof(proofs, proofFlags, leafHashes);
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return MerkleProof._hashPair(a, b);
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return MerkleProof._efficientHash(a, b);
    }
}