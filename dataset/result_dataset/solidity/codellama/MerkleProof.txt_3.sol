pragma solidity ^0.8.20;

library MerkleProof {
    struct Proof {
        bytes32[] proof;
        bytes32 root;
        bytes32 leaf;
    }

    struct ProofFlags {
        bool[] flags;
    }

    function verify(Proof memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        bytes32 computedRoot = processProof(proof.proof, proof.leaf);
        return computedRoot == root;
    }

    function verifyCalldata(Proof memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        bytes32 computedRoot = processProofCalldata(proof.proof, proof.leaf);
        return computedRoot == root;
    }

    function processProof(bytes32[] memory proof, bytes32 leaf) public pure returns (bytes32) {
        bytes32 root = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            root = _hashPair(proof[i], root);
        }
        return root;
    }

    function processProofCalldata(bytes32[] memory proof, bytes32 leaf) public pure returns (bytes32) {
        bytes32 root = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            root = _efficientHash(proof[i], root);
        }
        return root;
    }

    function multiProofVerify(Proof[] memory proofs, ProofFlags memory flags, bytes32[] memory roots, bytes32[] memory leafs) public pure returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (!verify(proof[i], roots[i], leafs[i])) {
                return false;
            }
        }
        return true;
    }

    function multiProofVerifyCalldata(Proof[] memory proofs, ProofFlags memory flags, bytes32[] memory roots, bytes32[] memory leafs) public pure returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (!verifyCalldata(proof[i], roots[i], leafs[i])) {
                return false;
            }
        }
        return true;
    }

    function processMultiProof(bytes32[] memory proof, ProofFlags memory flags, bytes32[] memory leafs) public pure returns (bytes32) {
        bytes32 root = leafs[0];
        for (uint256 i = 0; i < proof.length; i++) {
            root = _hashPair(proof[i], root);
        }
        return root;
    }

    function processMultiProofCalldata(bytes32[] memory proof, ProofFlags memory flags, bytes32[] memory leafs) public pure returns (bytes32) {
        bytes32 root = leafs[0];
        for (uint256 i = 0; i < proof.length; i++) {
            root = _efficientHash(proof[i], root);
        }
        return root;
    }

    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }

    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }
}