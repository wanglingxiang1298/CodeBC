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
                computedHash = _efficientHash(computedHash, proofElement);
            } else {
                computedHash = _efficientHash(proofElement, computedHash);
            }
        }
    }
    function multiProofVerify(
        bytes32[] memory proof,
        bool[] memory proofFlags,
        bytes32[] memory root,
        bytes32[] memory leaf
    ) internal pure returns (bool) {
        require(proof.length == proofFlags.length, "MULTIPROOF_INVALID_MULTIPROOF");
        require(proof.length == root.length, "MULTIPROOF_INVALID_MULTIPROOF");
        require(proof.length == leaf.length, "MULTIPROOF_INVALID_MULTIPROOF");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = processProof(proof[i], leaf[i]);
            } else {
                computedHash = leaf[i];
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
        require(proof.length == proofFlags.length, "MULTIPROOF_INVALID_MULTIPROOF");
        require(proof.length == root.length, "MULTIPROOF_INVALID_MULTIPROOF");
        require(proof.length == leaf.length, "MULTIPROOF_INVALID_MULTIPROOF");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = processProofCalldata(proof[i], leaf[i]);
            } else {
                computedHash = leaf[i];
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
            if (proofFlags[i]) {
                computedHash = processProof(proof[i], leaf[i]);
            } else {
                computedHash = leaf[i];
            }
        }
        return computedHash;
    }
    function processMultiProofCalldata(
        bytes32[] calldata proof,
        bool[] memory proofFlags,
        bytes32[] calldata leaf
    ) internal pure returns (bytes32 computedHash) {
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = processProofCalldata(proof[i], leaf[i]);
            } else {
                computedHash = leaf[i];
            }
        }
    }
    function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        assembly {
            mstore(0x00, a)
            mstore(0x20, b)
            mstore(0x00, keccak256(0x00, 0x40))
        }
        return bytes32(uint256(keccak256(0x00, 0x40)));
    }
    function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        if (uint256(a) < uint256(b)) {
            return bytes32(uint256(uint256(b) ^ uint256(a)));
        } else {
            return bytes32(uint256(uint256(a) ^ uint256(b)));
        }
    }
}
