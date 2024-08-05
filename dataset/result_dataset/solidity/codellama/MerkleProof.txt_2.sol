pragma solidity ^0.8.20;

import "MerkleProof.sol";

contract MerkleProofVerifier {
    using MerkleProof for bytes32;

    struct Proof {
        bytes32[] proof;
        bytes32 root;
        bytes32 leaf;
    }

    struct MultiProof {
        bytes32[] proof;
        bytes32[] roots;
        bytes32[] leaves;
    }

    function verify(Proof memory proof) public view returns (bool) {
        return proof.root.verify(proof.proof, proof.leaf);
    }

    function verifyCalldata(Proof memory proof) public view returns (bool) {
        return proof.root.verifyCalldata(proof.proof, proof.leaf);
    }

    function processProof(Proof memory proof) public view returns (bytes32) {
        return proof.root.processProof(proof.proof, proof.leaf);
    }

    function processProofCalldata(Proof memory proof) public view returns (bytes32) {
        return proof.root.processProofCalldata(proof.proof, proof.leaf);
    }

    function multiProofVerify(MultiProof memory multiProof) public view returns (bool) {
        return multiProof.root.verify(multiProof.proof, multiProof.roots, multiProof.leaves);
    }

    function multiProofVerifyCalldata(MultiProof memory multiProof) public view returns (bool) {
        return multiProof.root.verifyCalldata(multiProof.proof, multiProof.roots, multiProof.leaves);
    }

    function processMultiProof(MultiProof memory multiProof) public view returns (bytes32) {
        return multiProof.root.processMultiProof(multiProof.proof, multiProof.roots, multiProof.leaves);
    }

    function processMultiProofCalldata(MultiProof memory multiProof) public view returns (bytes32) {
        return multiProof.root.processMultiProofCalldata(multiProof.proof, multiProof.roots, multiProof.leaves);
    }

    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return a.hashPair(b);
    }

    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return a.efficientHash(b);
    }
}