pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleVerifier {
    using SafeMath for uint256;
    function verify(bytes32[] memory proofs, bytes32 root) public pure returns (bool) {
        bytes32 root2 = root;
        for (uint256 i = 0; i < proofs.length; i++) {
            bytes32 proof = proofs[i];
            root2 = MerkleProofLib.verify(proof, root2, MerkleProofLib.getLeftChild(proof), MerkleProofLib.getRightChild(proof));
        }
        return root2 == root;
    }
    function verifyCalldata(bytes32[] memory proofs, bytes32 root, bytes32 leaf) public view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            bytes32 proof = proofs[i];
            root = MerkleProofLib.verify(proof, root, MerkleProofLib.getLeftChild(proof), MerkleProofLib.getRightChild(proof));
        }
        return root == leaf;
    }
    function processProof(bytes32[] memory proofs, bytes32 root) public view returns (bytes32) {
        bytes32 rootResult = root;
        for (uint256 i = 0; i < proofs.length; i++) {
            bytes32 proof = proofs[i];
            rootResult = MerkleProofLib.verify(proof, rootResult, MerkleProofLib.getLeftChild(proof), MerkleProofLib.getRightChild(proof));
        }
        return rootResult;
    }
    function processProofCalldata(bytes32[] memory proofs, bytes32 root, bytes32 leaf) public view returns (bytes32) {
        for (uint256 i = 0; i < proofs.length; i++) {
            bytes32 proof = proofs[i];
            root = MerkleProofLib.verify(proof, root, MerkleProofLib.getLeftChild(proof), MerkleProofLib.getRightChild(proof));
        }
        return root == leaf;
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32 leafHash) public view returns (bool) {
        bytes32 rootResult = rootHashes[0];
        for (uint256 i = 1; i < proofs.length; i++) {
            if (proofFlags[i]) {
                rootResult = MerkleProofLib.verify(proofs[i], rootResult, MerkleProofLib.getLeftChild(proofs[i]), MerkleProofLib.getRightChild(proofs[i]));
            } else {
                revert("Proof flag is false");
            }
        }
        return rootResult == leafHash;
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32 leafHash) public view returns (bool) {
        bytes32 rootResult = rootHashes[0];
        for (uint256 i = 1; i < proofs.length; i++) {
            if (proofFlags[i]) {
                rootResult = MerkleProofLib.verify(proofs[i], rootResult, MerkleProofLib.getLeftChild(proofs[i]), MerkleProofLib.getRightChild(proofs[i]));
            } else {
                revert("Proof flag is false");
            }
        }
        return rootResult == leafHash;
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes) public view returns (bytes32) {
        bytes32 rootResult = rootHashes[0];
        for (uint256 i = 1; i < proofs.length; i++) {
            if (proofFlags[i]) {
                rootResult = MerkleProofLib.verify(proofs[i], rootResult, MerkleProofLib.getLeftChild(proofs[i]), MerkleProofLib.getRightChild(proofs[i]));
            } else {
                revert("Proof flag is false");
            }
        }
        return rootResult;
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32 leafHash) public view returns (bytes32) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                rootHashes[i] = MerkleProofLib.verify(proofs[i], rootHashes[i], MerkleProofLib.getLeftChild(proofs[i]), MerkleProofLib.getRightChild(proofs[i]));
            } else {
                revert("Proof flag is false");
            }
        }
        return rootHashes[rootHashes.length - 1];
    }
    private function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        for (uint256 i = 32; i < 32 + 32; i += 32) {
            bytes32 subA = a.slice(i, 32);
            bytes32 subB = b.slice(i, 32);
            a = _efficientHash(subA, subB);
        }
        return a;
    }
    private function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        bytes32[][] memory cols = new bytes32[2][]();
        cols[0] = [a, b];
        for (uint256 i = 1; i < 32; i++) {
            bytes32 col;
            if (i % 2 == 0) {
                col = _hashPair(cols[i / 2][0], cols[i / 2][1]);
            } else {
                col = cols[(i - 1) / 2][0];
            }
            cols[i / 2] = [col, cols[i / 2][1]];
        }
        return cols[31][0];
    }
}
contract MerkleProofLib is SafeMath {
    function verify(bytes32 proof, bytes32 root, bytes32 leftChild, bytes32 rightChild) public pure returns (bytes32) {
        bytes32 hash = leftChild;
        for (uint256 i = 256; i > 0; i = uint256(i / 2)) {
            if (proof[uint256(31 - i / 2)] == uint8(0)) {
                root = _hashPair(root, leftChild);
            } else {
                root = _hashPair(root, rightChild);
            }
            return hash;
        }
        else if (bytes32 proof) {
            return hash;
        }
        else if (byte32) {
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return hash;
            return;
            return;
            return;
            return hash;