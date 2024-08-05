pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleVerifier {
    using SafeMath for uint256;
    uint256 constant MAX_PROOF_DEPTH = 32;
    mapping(uint256 => MerkleProof) public proofs;
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        MerkleProofLib.verify(proof, root, leaf);
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bool) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proof.slice(4, 32);
        bytes32[] memory values = new bytes32[](proof.length / 4);
        for (uint256 i = 0; i < proof.length; i += 4) {
            values[i / 4] = proof[i];
        }
        return MerkleProofLib.verify(types, values, root, leaf);
    }
    function processProof(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bytes32) {
        return MerkleProofLib.processProof(proof, leaf, root);
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bytes32) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proof.slice(4, 32);
        bytes32[] memory values = new bytes32[](proof.length / 4);
        for (uint256 i = 0; i < proof.length; i += 4) {
            values[i / 4] = proof[i];
        }
        return MerkleProofLib.processProof(types, values, leaf, root);
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public pure returns (bool) {
        MerkleProofLib.multiProofVerify(proofs, proofFlags, root, leaf);
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public view returns (bool) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proofs.slice(4, 32);
        bytes32[] memory values = new bytes32[](proofs.length / 4);
        for (uint256 i = 0; i < proofs.length; i += 4) {
            values[i / 4] = proofs[i];
        }
        return MerkleProofLib.multiProofVerify(types, proofFlags, values, root, leaf);
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public view returns (bytes32) {
        return MerkleProofLib.processMultiProof(proofs, proofFlags, leaf, root);
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public view returns (bytes32) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proofs.slice(4, 32);
        bytes32[] memory values = new bytes32[](proofs.length / 4);
        for (uint256 i = 0; i < proofs.length; i += 4) {
            values[i / 4] = proofs[i];
        }
        return MerkleProofLib.processMultiProof(types, proofFlags, values, leaf, root);
    }
    function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a == b ? hash32(a) : if_else(a > b, hash32(a), hash32(b));
    }
    function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        bytes32[](uint256) memory segments = new bytes32[](2);
        bytes32 pointer;
        do {
            segments[0] = a;
            pointer = _hashPair(segments[0], b);
        } while (segments.length > 1);
        return pointer;
    }
}
library MerkleProof {
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) public pure returns (bool) {
        bytes32 computedRoot = computeRoot(proof, proof.length, leaf);
        return computedRoot == root;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) public view returns (bool) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proof.slice(4, 32);
        bytes32[] memory values = new bytes32[](proof.length / 4);
        for (uint256 i = 0; i < proof.length; i += 4) {
            values[i / 4] = proof[i];
        }
        return computeRoot(values, values.length, leaf) == root;
    }
    function processProof(bytes32[] memory proof, bytes32 leaf, bytes32 root) public view returns (bytes32) {
        return computeRoot(proof, proof.length, leaf, root);
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 leaf, bytes32 root) public view returns (bytes32) {
        bytes32[] memory types = new bytes32[](1);
        types[0] = proof.slice(4, 32);
        bytes32[] memory values = new bytes32[](proof.length / 4);
        for (uint256 i = 0; i < proof.length; i += 4) {
            values[i / 4] = proof[i];
        }
        return computeRoot(types, values.length, leaf, root);
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public pure returns (bool) {
        bytes32 computedRoot = computeRoot(proofs, proofs.length, leaf);
        return computedRoot == root;
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory root, bytes32[] memory leaf) public view returns (bool) {
        bytes32[] memory types = new bytes32[](proofs.length / 32);
        bytes32[] memory proofs = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory types = new bytes32[] memory[] new bytes32[] new bytes = new bytes[] new bytes[] new bytes = new bytes[] new bytes[] new bytes[] new bytes = new bytes[] new bytes = new[] new bytes = new bytes=new bytes = new bytes = new bytes = new bytes = new bytes = new bytes=new bytes=new bytes=new bytes=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=new=