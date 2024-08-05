pragma solidity ^0.8.20;
library MerkleProof {
    bytes32 constant _HASH_ID = keccak256("merkle-tree-hash");
    function verify(bytes32[] memory proof, bytes32 rootHash, bytes32 leafHash) public pure returns (bool) {
        bytes32 currentHash = leafHash;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash == rootHash;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 rootHash, bytes32 leafHash) public pure returns (bool) {
        bytes32 currentHash = leafHash;
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash == rootHash;
    }
    function processProof(bytes32[] memory proof, bytes32[] memory leafHashes) public pure returns (bytes32) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash;
    }
    function processProofCalldata(bytes32[] memory proof, bytes32[] memory leafHashes) public pure returns (bytes32) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash;
    }
    function multiProofVerify(bytes32[] memory proof, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public pure returns (bool) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash == rootHashes[0];
    }
    function multiProofVerifyCalldata(bytes32[] memory proof, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public pure returns (bool) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash == rootHashes[0];
    }
    function processMultiProof(bytes32[] memory proof, uint256[] memory proofFlags, bytes32[] memory leafHashes) public pure returns (bytes32) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash;
    }
    function processMultiProofCalldata(bytes32[] memory proof, uint256[] memory proofFlags, bytes32[] memory leafHashes) public pure returns (bytes32) {
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < proof.length; i++) {
            bytes32 proofElement = proof[i];
            if (bytes32(proofElement >> 256) == _HASH_ID) {
                currentHash = _efficientHash(proofElement, currentHash);
            } else {
                currentHash = _hashPair(proofElement, currentHash);
            }
        }
        return currentHash;
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        uint256 aUint = uint256(a);
        uint256 bUint = uint256(b);
        uint256 carry = addmod(aUint, bUint, uint256(-1));
        uint256 res = submod(keccak256(abi.encodePacked(bytes32(carry))), bytes32(uint256(1)), bytes32(uint256(1)));
        return res;
    }
}