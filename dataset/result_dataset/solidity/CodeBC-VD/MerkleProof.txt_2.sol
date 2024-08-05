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
            bytes32 proofElement = proof[i];
            if (computedHash <= proofElement) {
                computedHash = _hashPair(computedHash, proofElement);
            } else {
                computedHash = _hashPair(proofElement, computedHash);
            }
        }
        return computedHash;
    }
    function processProofCalldata(bytes32[] calldata proof, bytes32 leaf) internal pure returns (bytes32) {
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
    function multiProofVerify(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) internal pure returns (bool) {
        require(proof.length == root.length, "MerkleProof: inconsistent length of proof and roots arrays");
        require(proof.length == leaf.length, "MerkleProof: inconsistent length of proof and leaf arrays");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leaf[i];
            } else {
                computedHash = processProof(proof[i], leaf[i]);
            }
            if (computedHash!= root[i]) {
                return false;
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(bytes32[] calldata proof, bool[] memory proofFlags, bytes32[] calldata root, bytes32[] calldata leaf) internal pure returns (bool) {
        require(proof.length == root.length, "MerkleProof: inconsistent length of proof and roots arrays");
        require(proof.length == leaf.length, "MerkleProof: inconsistent length of proof and leaf arrays");
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leaf[i];
            } else {
                computedHash = processProofCalldata(proof[i], leaf[i]);
            }
            if (computedHash!= root[i]) {
                return false;
            }
        }
        return true;
    }
    function processMultiProof(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory leaf) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leaf[i];
            } else {
                computedHash = processProof(proof[i], leaf[i]);
            }
        }
        return computedHash;
    }
    function processMultiProofCalldata(bytes32[] calldata proof, bool[] memory proofFlags, bytes32[] calldata leaf) internal pure returns (bytes32) {
        bytes32 computedHash;
        for (uint256 i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                computedHash = leaf[i];
            } else {
                computedHash = processProofCalldata(proof[i], leaf[i]);
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
        uint256 cInt = aInt ^ bInt;
        return bytes32(cInt);
    }
}
