pragma solidity ^0.8.20;
library MerkleProof {
    error MerkleProofInvalidMultiproof();
    function verify(
        bytes32[] memory proof,
        bytes32 root,
        bytes32 leaf
    ) internal pure returns (bool) {
        return processProof(proof, leaf) == root;
    }
    function verifyCalldata(
        bytes32[] calldata proof,
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
    function processProofCalldata(
        bytes32[] calldata proof,
        bytes32 leaf
    ) internal pure returns (bytes32 computedHash) {
        computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _hashPair(computedHash, proofElement);
            } else {
                computedHash = _hashPair(proofElement, computedHash);
            }
        }
    }
    function multiProofVerify(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory root,
        bytes32[] memory leaf
    ) internal pure returns (bool) {
        require(proof.length == root.length, "MerkleProof: length mismatch");
        require(proof.length == leaf.length, "MerkleProof: length mismatch");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            bool isFlagSet = proofFlags[i];
            if (isFlagSet) {
                computedHash = _efficientHash(computedHash, leaf[i]);
            } else {
                computedHash = _efficientHash(leaf[i], computedHash);
            }
            if (computedHash!= root[i]) {
                return false;
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(
        bytes32[] calldata proof,
        bool[] memory proofFlags,
        bytes32[] calldata root,
        bytes32[] calldata leaf
    ) internal pure returns (bool) {
        require(proof.length == root.length, "MerkleProof: length mismatch");
        require(proof.length == leaf.length, "MerkleProof: length mismatch");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            bool isFlagSet = proofFlags[i];
            if (isFlagSet) {
                computedHash = _hashPair(computedHash, leaf[i]);
            } else {
                computedHash = _hashPair(leaf[i], computedHash);
            }
            if (computedHash!= root[i]) {
                return false;
            }
        }
        return true;
    }
    function processMultiProof(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory leaf
    ) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            bool isFlagSet = proofFlags[i];
            if (isFlagSet) {
                computedHash = _efficientHash(computedHash, leaf[i]);
            } else {
                computedHash = _efficientHash(leaf[i], computedHash);
            }
            computedHash = processProof(proof, computedHash);
        }
        return computedHash;
    }
    function processMultiProofCalldata(
        bytes32[] calldata proof,
        bool[] memory proofFlags,
        bytes32[] calldata leaf
    ) internal pure returns (bytes32 computedHash) {
        computedHash = processProofCalldata(proof, leaf[0]);
        for (uint256 i = 1; i < proof.length; i++) {
            bool isFlagSet = proofFlags[i];
            if (isFlagSet) {
                computedHash = _hashPair(computedHash, leaf[i]);
            } else {
                computedHash = _hashPair(leaf[i], computedHash);
            }
            computedHash = processProofCalldata(proof, computedHash);
        }
    }
    function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }
    function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        if (a <= b) {
            return keccak256(abi.encodePacked(b, a));
        } else {
            return keccak256(abi.encodePacked(a, b));
        }
    }
}
