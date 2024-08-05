pragma solidity ^0.8.20;
library MerkleProof {
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _efficientHash(computedHash, proofElement);
            } else {
                computedHash = _efficientHash(proofElement, computedHash);
            }
        }
        return computedHash == root;
    }
    function verifyCalldata(bytes32[] calldata proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _efficientHash(computedHash, proofElement);
            } else {
                computedHash = _efficientHash(proofElement, computedHash);
            }
        }
        return computedHash == root;
    }
    function processProof(bytes32[] memory proof, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedHash = _efficientHash(computedHash, proof[i]);
        }
        return computedHash;
    }
    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 computedHash = leaf;
        for (uint256 i = 0; i < proof.length; i++) {
            computedHash = _efficientHash(computedHash, proof[i]);
        }
        return computedHash;
    }
    function multiProofVerify(
        bytes32[][] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory roots,
        bytes32[] memory leafs
    ) internal pure returns (bool) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leafs[i];
            } else {
                computedHash = processProof(proof[i], leafs[i]);
            }
            if (computedHash!= roots[i]) {
                return false;
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(
        bytes32[][] calldata proof,
        bool[] memory proofFlags,
        bytes32[] memory roots,
        bytes32[] memory leafs
    ) internal pure returns (bool) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leafs[i];
            } else {
                computedHash = processProofCalldata(proof[i], leafs[i]);
            }
            if (computedHash!= roots[i]) {
                return false;
            }
        }
        return true;
    }
    function processMultiProof(
        bytes32[][] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory leafs
    ) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leafs[i];
            } else {
                computedHash = processProof(proof[i], leafs[i]);
            }
        }
        return computedHash;
    }
    function processMultiProofCalldata(
        bytes32[][] calldata proof,
        bool[] memory proofFlags,
        bytes32[] memory leafs
    ) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leafs[i];
            } else {
                computedHash = processProofCalldata(proof[i], leafs[i]);
            }
        }
        return computedHash;
    }
    function _hashPair(bytes32 a, bytes32 b) private pure returns (bytes32) {
        if (a < b) {
            return keccak256(abi.encodePacked(a, b));
        } else {
            return keccak256(abi.encodePacked(b, a));
        }
    }
    function _efficientHash(bytes32 a, bytes32 b) private pure returns (bytes32) {
        if (uint256(a) < uint256(b)) {
            return a ^ b;
        } else {
            return b ^ a;
        }
    }
}
