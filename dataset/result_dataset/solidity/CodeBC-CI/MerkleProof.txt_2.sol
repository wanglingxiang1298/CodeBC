pragma solidity ^0.8.20;
contract MerkleProof {
    error MerkleProofInvalidMultiproof();
    function verify(bytes32[] memory merkleProof, bytes32 rootHash, bytes32 leafNodeHash) public pure returns (bool) {
        bytes32 currentHash = leafNodeHash;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            currentHash = _hashPair(currentHash, merkleProof[i]);
        }
        return currentHash == rootHash;
    }
    function verifyCalldata(bytes32[] memory merkleProof, bytes32 rootHash, bytes32 leafNodeHash) public pure returns (bool) {
        bytes32 currentHash = leafNodeHash;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            currentHash = _hashPair(currentHash, merkleProof[i]);
        }
        return currentHash == rootHash;
    }
    function processProof(bytes32[] memory merkleProof, bytes32[] memory leafNodeHashes) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
        }
        rootHash = processMultiProof(merkleProof, proofFlags, leafNodeHashes);
    }
    function processProofCalldata(bytes32[] memory merkleProof, bytes32[] memory leafNodeHashes) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
        }
        rootHash = processMultiProof(merkleProof, proofFlags, leafNodeHashes);
    }
    function multiProofVerify(bytes32[] memory merkleProof, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public pure returns (bool) {
        require(merkleProof.length == proofFlags.length && merkleProof.length == rootHashes.length && merkleProof.length == leafNodeHashes.length, "MerkleProof: invalid multiproof");
        for (uint256 i = 0; i < merkleProof.length; i++) {
            if (proofFlags[i] == 0) {
                merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
            }
        }
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < merkleProof.length; i++) {
            currentHash = _hashPair(currentHash, merkleProof[i]);
        }
        return currentHash == rootHashes[0];
    }
    function multiProofVerifyCalldata(bytes32[] memory merkleProof, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public pure returns (bool) {
        require(merkleProof.length == proofFlags.length && merkleProof.length == rootHashes.length && merkleProof.length == leafNodeHashes.length, "MerkleProof: invalid multiproof");
        for (uint256 i = 0; i < merkleProof.length; i++) {
            if (proofFlags[i] == 0) {
                merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
            }
        }
        bytes32 currentHash = bytes32(0);
        for (uint256 i = 0; i < merkleProof.length; i++) {
            currentHash = _hashPair(currentHash, merkleProof[i]);
        }
        return currentHash == rootHashes[0];
    }
    function processMultiProof(bytes32[] memory merkleProof, uint256[] memory proofFlags, bytes32[] memory leafNodeHashes) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            if (proofFlags[i] == 0) {
                merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
            }
        }
        rootHash = processMultiProof(merkleProof, proofFlags, leafNodeHashes);
    }
    function processMultiProofCalldata(bytes32[] memory merkleProof, uint256[] memory proofFlags, bytes32[] memory leafNodeHashes) public pure returns (bytes32 rootHash) {
        for (uint256 i = 0; i < merkleProof.length; i++) {
            if (proofFlags[i] == 0) {
                merkleProof[i] = _efficientHash(merkleProof[i], leafNodeHashes[i]);
            }
        }
        rootHash = processMultiProof(merkleProof, proofFlags, leafNodeHashes);
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return keccak256(abi.encode(a, b));
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        if (a.length < b.length) {
            bytes32 temp = a;
            a = b;
            b = temp;
        }
        return keccak256(abi.encodePacked(a, b));
    }
}