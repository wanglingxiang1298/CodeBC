pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleProofVerifier {
    using(MerkleProof = "0x0");
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        bytes32 computedHash = MerkleProof.hash(leaf, proof);
        return computedHash == root;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bool) {
        bytes32 computedHash = MerkleProof.hash(leaf, proof);
        require(computedHash == root, "Invalid proof");
        return true;
    }
    function processProof(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bytes32) {
        bytes32 currentHash = leaf;
        for (uint i = proof.length - 1; i > 0; i--) {
            currentHash = MerkleProof.hash(proof[i], [currentHash]);
        }
        return currentHash;
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bytes32) {
        bytes32 currentHash = leaf;
        for (uint i = proof.length - 1; i > 0; i--) {
            currentHash = MerkleProof.hash(proof[i], [currentHash]);
        }
        require(currentHash == root, "Invalid proof");
        return currentHash;
    }
    function multiProofVerify(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public pure returns (bool) {
        bytes32 root = rootHashes[0];
        for (uint i = 1; i < rootHashes.length; i++) {
            root = MerkleProof.hash(root, [rootHashes[i]]);
        }
        for (uint i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                bytes32 computedHash = MerkleProof.hash(leafHashes[i], proof[i]);
                require(computedHash == root, "Invalid proof");
                root = MerkleProof.hash(root, [proof[i]]);
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bool) {
        bytes32 root = rootHashes[0];
        for (uint i = 1; i < rootHashes.length; i++) {
            root = MerkleProof.hash(root, [rootHashes[i]]);
        }
        for (uint i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                bytes32 computedHash = MerkleProof.hash(leafHashes[i], proof[i]);
                require(computedHash == root, "Invalid proof");
                root = MerkleProof.hash(root, [proof[i]]);
            }
        }
        return true;
    }
    function processMultiProof(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public pure returns (bytes32) {
        bytes32 root = rootHashes[0];
        for (uint i = 1; i < rootHashes.length; i++) {
            root = MerkleProof.hash(root, [rootHashes[i]]);
        }
        for (uint i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                bytes32 currentHash = leafHashes[i];
                for (uint j = proof[i].length - 1; j > 0; j--) {
                    currentHash = MerkleProof.hash(currentHash, [proof[i][j]]);
                }
                root = MerkleProof.hash(root, [currentHash]);
            }
        }
        return root;
    }
    function processMultiProofCalldata(bytes32[] memory proof, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bytes32) {
        bytes32 root = rootHashes[0];
        for (uint i = 1; i < rootHashes.length; i++) {
            root = MerkleProof.hash(root, [rootHashes[i]]);
        }
        for (uint i = 0; i < proof.length; i++) {
            if (proofFlags[i]) {
                bytes32 currentHash = leafHashes[i];
                for (uint j = proof[i].length - 1; j > 0; j--) {
                    currentHash = MerkleProof.hash(currentHash, [proof[i][j]]);
                }
                require(currentHash == root, "Invalid proof");
                root = MerkleProof.hash(root, [currentHash]);
            }
        }
        return root;
    }
    private function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a == MerkleProof.hash(b, [a]) ? a : b;
    }
    private function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        bytes32[2] memory hashes = [a, b];
        for (uint i = 1; i < a.length; i++) {
            bytes32 currentHash = MerkleProof.hash(hashes[i % 2], [hashes[(i - 1) % 2]]);
            hashes[i % 2] = currentHash;
        }
        return hashes[1];
    }
}