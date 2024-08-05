pragma solidity ^0.8.20;

library MerkleProof {
    struct Proof {
        bytes32[] proof;
        bytes32 root;
        bytes32 leaf;
    }

    function verify(Proof memory proof) public view returns (bool) {
        bytes32 computedRoot = processProof(proof.proof, proof.leaf);
        return computedRoot == proof.root;
    }

    function verifyCalldata(Proof memory proof) public view returns (bool) {
        bytes32 computedRoot = processProofCalldata(proof.proof, proof.leaf);
        return computedRoot == proof.root;
    }

    function processProof(bytes32[] memory proof, bytes32 leaf) public view returns (bytes32) {
        bytes32 computedRoot = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedRoot = _hashPair(computedRoot, proof[i]);
        }
        return computedRoot;
    }

    function processProofCalldata(bytes32[] memory proof, bytes32 leaf) public view returns (bytes32) {
        bytes32 computedRoot = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedRoot = _efficientHash(computedRoot, proof[i]);
        }
        return computedRoot;
    }

    function multiProofVerify(Proof[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32[] memory leafs) public view returns (bool) {
        bytes32[] memory computedRoots = new bytes32[](proofs.length);
        for (uint256 i = 0; i < proofs.length; i++) {
            computedRoots[i] = processMultiProof(proofs[i].proof, proofs[i].leaf);
        }
        for (uint256 i = 0; i < proofFlags.length; i++) {
            if (proofFlags[i] && computedRoots[i]!= roots[i]) {
                return false;
            }
        }
        return true;
    }

    function multiProofVerifyCalldata(Proof[] memory proofs, bool[] memory proofFlags, bytes32[] memory roots, bytes32[] memory leafs) public view returns (bool) {
        bytes32[] memory computedRoots = new bytes32[](proofs.length);
        for (uint256 i = 0; i < proofs.length; i++) {
            computedRoots[i] = processMultiProofCalldata(proofs[i].proof, proofs[i].leaf);
        }
        for (uint256 i = 0; i < proofFlags.length; i++) {
            if (proofFlags[i] && computedRoots[i]!= roots[i]) {
                return false;
            }
        }
        return true;
    }

    function processMultiProof(bytes32[] memory proof, bytes32 leaf) public view returns (bytes32) {
        bytes32 computedRoot = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedRoot = _hashPair(computedRoot, proof[i]);
        }
        return computedRoot;
    }

    function processMultiProofCalldata(bytes32[] memory proof, bytes32 leaf) public view returns (bytes32) {
        bytes32 computedRoot = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedRoot = _efficientHash(computedRoot, proof[i]);
        }
        return computedRoot;
    }

    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }

    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }
}