pragma solidity ^0.8.20;
library MerkleProof {
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        bytes32 branch = proof[proof.length - 1];
        bytes32 current = leaf;
        for (uint i = proof.length - 2; i >= 0; i--) {
            current = keccak256(branch, current);
            branch = proof[i];
        }
        return current == root;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        bytes32 branch = proof[proof.length - 1];
        bytes32 current = leaf;
        for (uint i = proof.length - 2; i >= 0; i--) {
            current = keccak256(branch, current);
            branch = proof[i];
        }
        return current == root;
    }
    function processProof(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 current = leaf;
        for (uint i = proof.length - 1; i >= 0; i--) {
            current = keccak256(proof[i], current);
        }
        return current == root ? current : keccak256(current, root);
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 current = leaf;
        for (uint i = proof.length - 1; i >= 0; i--) {
            current = keccak256(proof[i], current);
        }
        return current == root ? current : keccak256(current, root);
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) internal pure returns (bool) {
        bytes32 root = rootHashes[rootHashes.length - 1];
        for (uint i = 0; i < proofs.length; i++) {
            if (!proofFlags[i]) {
                continue;
            }
            bytes32 current = leafHashes[leafHashes.length - 1];
            for (uint j = 0; j < proofs[i].length - 1; j++) {
                current = keccak256(proofs[i][j], current);
            }
            root = current == root ? root : keccak256(current, root);
        }
        return root == rootHashes[rootHashes.length - 1];
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) internal pure returns (bool) {
        bytes32 root = rootHashes[rootHashes.length - 1];
        for (uint i = 0; i < proofs.length; i++) {
            if (!proofFlags[i]) {
                continue;
            }
            bytes32 current = leafHashes[leafHashes.length - 1];
            for (uint j = 0; j < proofs[i].length - 1; j++) {
                current = keccak256(proofs[i][j], current);
            }
            root = current == root ? root : keccak256(current, root);
        }
        return root == rootHashes[rootHashes.length - 1];
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory leafHashes) internal pure returns (bytes32) {
        bytes32 root = leafHashes[leafHashes.length - 1];
        for (uint i = 0; i < proofs.length; i++) {
            if (!proofFlags[i]) {
                continue;
            }
            bytes32 current = leafHashes[leafHashes.length - 1];
            for (uint j = 0; j < proofs[i].length - 1; j++) {
                current = keccak256(proofs[i][j], current);
            }
            root = current == root ? root : keccak256(current, root);
        }
        return root;
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory leafHashes) internal pure returns (bytes32) {
        bytes32 root = leafHashes[leafHashes.length - 1];
        for (uint i = 0; i < proofs.length; i++) {
            if (!proofFlags[i]) {
                continue;
            }
            bytes32 current = leafHashes[leafHashes.length - 1];
            for (uint j = 0; j < proofs[i].length - 1; j++) {
                current = keccak256(proofs[i][j], current);
            }
            root = current == root ? root : keccak256(current, root);
        }
        return root;
    }
    private function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }
    private function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        for (uint i = 32; i < a.length; i += 32) {
            bytes32 partA = bytes32(a.slice(i - 32, i));
            bytes32 partB = bytes32(b.slice(i - 32, i));
            a = keccak256(partA, partB);
        }
        return a;
    }
}