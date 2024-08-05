pragma solidity ^0.8.20;
contract MerkleProof {
    error MerkleProofInvalidMultiproof();
    function _hashPair(bytes32 a, bytes32 b) private pure returns (bytes32) {
        if (a <= b) {
            return keccak256(abi.encode(a, b));
        } else {
            return keccak256(abi.encode(b, a));
        }
    }
    function _efficientHash(bytes32 a, bytes32 b) private pure returns (bytes32) {
        if (a <= b) {
            return a + b;
        } else {
            return a - b;
        }
    }
    function processProof(bytes32[] memory merkleProof, bytes32 leafNodeHash) public pure returns (bytes32) {
        bytes32 currentHash = leafNodeHash;
        for (uint256 i = 0; i < merkleProof.length; i++) {
            currentHash = _hashPair(currentHash, merkleProof[i]);
        }
        return currentHash;
    }
    function processProofCalldata(bytes calldata merkleProof, bytes32 leafNodeHash) public pure returns (bytes32) {
        bytes memory merkleProofMem = abi.decode(merkleProof, (bytes32[]));
        bytes32 currentHash = leafNodeHash;
        for (uint256 i = 0; i < merkleProofMem.length; i++) {
            currentHash = _hashPair(currentHash, merkleProofMem[i]);
        }
        return currentHash;
    }
    function verify(bytes32[] memory merkleProof, bytes32 rootHash, bytes32 leafNodeHash) public pure returns (bool) {
        bytes32 calculatedRootHash = processProof(merkleProof, leafNodeHash);
        return calculatedRootHash == rootHash;
    }
    function verifyCalldata(bytes calldata merkleProof, bytes32 rootHash, bytes32 leafNodeHash) public pure returns (bool) {
        bytes32 calculatedRootHash = processProofCalldata(merkleProof, leafNodeHash);
        return calculatedRootHash == rootHash;
    }
    function multiProofVerify(bytes32[] memory merkleProofs, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public pure returns (bool) {
        require(merkleProofs.length == proofFlags.length && merkleProofs.length == rootHashes.length && merkleProofs.length == leafNodeHashes.length, MerkleProofInvalidMultiproof());
        bytes32 calculatedRootHash;
        for (uint256 i = 0; i < merkleProofs.length; i++) {
            if ((proofFlags[i] & 1)!= 0) {
                calculatedRootHash = processProof(merkleProofs[i], leafNodeHashes[i]);
            } else {
                calculatedRootHash = processProofCalldata(merkleProofs[i], leafNodeHashes[i]);
            }
            if (calculatedRootHash!= rootHashes[i]) {
                return false;
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(bytes calldata merkleProofs, uint256[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafNodeHashes) public pure returns (bool) {
        bytes memory merkleProofsMem = abi.decode(merkleProofs, (bytes32[]));
        require(merkleProofsMem.length == proofFlags.length && merkleProofsMem.length == rootHashes.length && merkleProofsMem.length == leafNodeHashes.length, MerkleProofInvalidMultiproof());
        bytes32 calculatedRootHash;
        for (uint256 i = 0; i < merkleProofsMem.length; i++) {
            if ((proofFlags[i] & 1)!= 0) {
                calculatedRootHash = processProof(merkleProofsMem[i], leafNodeHashes[i]);
            } else {
                calculatedRootHash = processProofCalldata(merkleProofsMem[i], leafNodeHashes[i]);
            }
            if (calculatedRootHash!= rootHashes[i]) {
                return false;
            }
        }
        return true;
    }
    function processMultiProof(bytes32[] memory merkleProofs, uint256[] memory proofFlags, bytes32[] memory leafNodeHashes) public pure returns (bytes32) {
        bytes32 calculatedRootHash;
        for (uint256 i = 0; i < merkleProofs.length; i++) {
            if ((proofFlags[i] & 1)!= 0) {
                calculatedRootHash = processProof(merkleProofs[i], leafNodeHashes[i]);
            } else {
                calculatedRootHash = processProofCalldata(merkleProofs[i], leafNodeHashes[i]);
            }
        }
        return calculatedRootHash;
    }
    function processMultiProofCalldata(bytes calldata merkleProofs, uint256[] memory proofFlags, bytes32[] memory leafNodeHashes) public pure returns (bytes32) {
        bytes memory merkleProofsMem = abi.decode(merkleProofs, (bytes32[]));
        bytes32 calculatedRootHash;
        for (uint256 i = 0; i < merkleProofsMem.length; i++) {
            if ((proofFlags[i] & 1)!= 0) {
                calculatedRootHash = processProof(merkleProofsMem[i], leafNodeHashes[i]);
            } else {
                calculatedRootHash = processProofCalldata(merkleProofsMem[i], leafNodeHashes[i]);
            }
        }
        return calculatedRootHash;
    }
}