pragma solidity ^0.8.20;
library MerkleProof {
    function verify(bytes32[] memory merkleProof, bytes32 rootHash, bytes32 leafHash) public view returns (bool) {
        bytes32 computedHash = computeRootHash(merkleProof, leafHash);
        return computedHash == rootHash;
    }
    function computeRootHash(bytes32[] memory merkleProof, bytes32 leafHash) public pure returns (bytes32) {
        bytes32 hash = leafHash;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            hash = _efficientHash(hash, merkleProof[i]);
        }
        return hash;
    }
    function verifyCalldata(bytes32[] memory merkleProof, bytes32 rootHash, bytes32 leafHash) public view returns (bool) {
        bytes32 computedHash = computeRootHashCalldata(merkleProof, leafHash);
        return computedHash == rootHash;
    }
    function computeRootHashCalldata(bytes32[] memory merkleProof, bytes32 leafHash) public pure returns (bytes32) {
        bytes32 hash = leafHash;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            hash = _efficientHash(hash, merkleProof[i]);
        }
        return hash;
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(a, b));
    }
}

