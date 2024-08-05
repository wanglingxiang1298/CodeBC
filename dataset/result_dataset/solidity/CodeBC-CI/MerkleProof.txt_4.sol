pragma solidity ^0.8.20;
library MerkleProof {
    function verify(
        bytes32[] memory merkleProof,
        bytes32 rootHash,
        bytes32 leafNodeHash
    ) public pure returns (bool) {
        bytes32 computedHash = computeRootHash(merkleProof, leafNodeHash);
        return computedHash == rootHash;
    }
    function verifyCalldata(
        bytes32[] memory merkleProof,
        bytes32 rootHash,
        bytes32 leafNodeHash
    ) public pure returns (bool) {
        bytes32 computedHash = computeRootHashCalldata(merkleProof, leafNodeHash);
        return computedHash == rootHash;
    }
    function processProof(
        bytes32[] memory merkleProof,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            leafNodeHashes.push(_hashPair(leafNodeHashes[i], merkleProof[i]));
        }
        return computeRootHash(merkleProof, leafNodeHashes[merkleProof.length - 1]);
    }
    function processProofCalldata(
        bytes32[] memory merkleProof,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            leafNodeHashes.push(_hashPair(leafNodeHashes[i], merkleProof[i]));
        }
        return computeRootHashCalldata(merkleProof, leafNodeHashes[merkleProof.length - 1]);
    }
    function multiProofVerify(
        bytes32[] memory merkleProof,
        uint256[] memory proofFlags,
        bytes32[] memory rootHashes,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bool) {
        bytes32 computedHash = computeRootHash(merkleProof, leafNodeHashes[merkleProof.length - 1]);
        return computedHash == rootHashes[merkleProof.length - 1];
    }
    function multiProofVerifyCalldata(
        bytes32[] memory merkleProof,
        uint256[] memory proofFlags,
        bytes32[] memory rootHashes,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bool) {
        bytes32 computedHash = computeRootHashCalldata(merkleProof, leafNodeHashes[merkleProof.length - 1]);
        return computedHash == rootHashes[merkleProof.length - 1];
    }
    function processMultiProof(
        bytes32[] memory merkleProof,
        uint256[] memory proofFlags,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bytes32[] memory rootHashes) {
        bytes32[] memory computedHashes;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            bytes32 computedHash = computeRootHash(merkleProof, leafNodeHashes[i]);
            computedHashes.push(computedHash);
        }
        return computedHashes;
    }
    function processMultiProofCalldata(
        bytes32[] memory merkleProof,
        uint256[] memory proofFlags,
        bytes32[] memory leafNodeHashes
    ) public pure returns (bytes32[] memory rootHashes) {
        bytes32[] memory computedHashes;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            bytes32 computedHash = computeRootHashCalldata(merkleProof, leafNodeHashes[i]);
            computedHashes.push(computedHash);
        }
        return computedHashes;
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32 c) {
        c = keccak256(abi.encodePacked(a, b));
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32 c) {
        c = keccak256(abi.encodePacked(a, b));
    }
}