pragma solidity ^0.8.20;
library MerkleProof {
    function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) internal pure returns (bool) {
        return processProof(proof, leaf) == root;
    }
    function verifyCalldata(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) internal pure returns (bool) {
        return processProofCalldata(proof, leaf) == root;
    }
    function processProof(bytes32[] memory proof, bytes32 leaf)
        internal
        pure
        returns (bytes32)
    {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _efficientHash(computedHash, proofElement);
            } else {
                computedHash = _efficientHash(proofElement, computedHash);
            }
        }
        return computedHash;
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 leaf)
        internal
        pure
        returns (bytes32)
    {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _hashPair(computedHash, proofElement);
            } else {
                computedHash = _hashPair(proofElement, computedHash);
            }
        }
        return computedHash;
    }
    function multiProofVerify(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory root,
        bytes32[] memory leaf
    ) internal pure returns (bool) {
        require(proof.length == proofFlags.length, "MerkleProof: invalid length");
        require(proof.length == leaf.length, "MerkleProof: invalid length");
        require(proof.length == root.length, "MerkleProof: invalid length");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = _efficientHash(computedHash, proof[i]);
            } else {
                computedHash = _efficientHash(proof[i], computedHash);
            }
        }
        return computedHash == root[0];
    }
    function multiProofVerifyCalldata(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory root,
        bytes32[] memory leaf
    ) internal pure returns (bool) {
        require(proof.length == proofFlags.length, "MerkleProof: invalid length");
        require(proof.length == leaf.length, "MerkleProof: invalid length");
        require(proof.length == root.length, "MerkleProof: invalid length");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = _hashPair(computedHash, proof[i]);
            } else {
                computedHash = _hashPair(proof[i], computedHash);
            }
        }
        return computedHash == root[0];
    }
    function processMultiProof(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory leaf
    ) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = _efficientHash(computedHash, proof[i]);
            } else {
                computedHash = _efficientHash(proof[i], computedHash);
            }
        }
        return computedHash;
    }
    function processMultiProofCalldata(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory leaf
    ) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = _hashPair(computedHash, proof[i]);
            } else {
                computedHash = _hashPair(proof[i], computedHash);
            }
        }
        return computedHash;
    }
    function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }
    function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        uint256 aInt = uint256(a);
        uint256 bInt = uint256(b);
        uint256 cInt = aInt & bInt;
        return bytes32(cInt);
    }
}
