pragma solidity ^0.8.20;

import "MerkleProof.sol";

contract MerkleProofVerifier {
    using MerkleProof for bytes32;

    error MerkleProofInvalidMultiproof(string message) {
        return (MerkleProofInvalidMultiproof, message);
    }

    function verify(bytes32[] memory merkleProofs, bytes32 rootHash, bytes32 leafNodeHash) public view returns (bool) {
        return merkleProofs.verify(rootHash, leafNodeHash);
    }

    function verifyCalldata(bytes32[] memory merkleProofs, bytes32 rootHash, bytes32 leafNodeHash) public view returns (bool) {
        return merkleProofs.verifyCalldata(rootHash, leafNodeHash);
    }

    function processProof(bytes32[] memory merkleProofs, bytes32 leafNodeHash) public view returns (bytes32) {
        return merkleProofs.processProof(leafNodeHash);
    }

    function processProofCalldata(bytes32[] memory merkleProofs, bytes32 leafNodeHash) public view returns (bytes32) {
        return merkleProofs.processProofCalldata(leafNodeHash);
    }

    function multiProofVerify(bytes32[] memory merkleProofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public view returns (bool) {
        return merkleProofs.multiProofVerify(proofFlags, rootHashes, leafNodeHashes);
    }

    function multiProofVerifyCalldata(bytes32[] memory merkleProofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public view returns (bool) {
        return merkleProofs.multiProofVerifyCalldata(proofFlags, rootHashes, leafNodeHashes);
    }

    function processMultiProof(bytes32[] memory merkleProofs, bool[] memory proofFlags, bytes32[] memory leafNodeHashes) public view returns (bytes32) {
        return merkleProofs.processMultiProof(proofFlags, leafNodeHashes);
    }

    function processMultiProofCalldata(bytes32[] memory merkleProofs, bool[] memory proofFlags, bytes32[] memory leafNodeHashes) public view returns (bytes32) {
        return merkleProofs.processMultiProofCalldata(proofFlags, leafNodeHashes);
    }

    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return a.hashPair(b);
    }

    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return a.efficientHash(b);
    }
}