pragma solidity ^0.8.20;

import "MerkleProof.sol";

contract MerkleProofVerifier {
    using MerkleProof for bytes32;

    function verify(bytes32[] memory _proofs, bytes32 _rootHash, bytes32 _leafHash) public view returns (bool) {
        return _proofs.verify(_rootHash, _leafHash);
    }

    function verifyCalldata(bytes32[] memory _proofs, bytes32 _rootHash, bytes32 _leafHash) public view returns (bool) {
        return _proofs.verifyCalldata(_rootHash, _leafHash);
    }

    function processProof(bytes32[] memory _proofs, bytes32[] memory _leafHashes) public view returns (bytes32) {
        return _proofs.processProof(_leafHashes);
    }

    function processProofCalldata(bytes32[] memory _proofs, bytes32[] memory _leafHashes) public view returns (bytes32) {
        return _proofs.processProofCalldata(_leafHashes);
    }

    function multiProofVerify(bytes32[] memory _proofs, bool[] memory _proofFlags, bytes32[] memory _rootHashes, bytes32[] memory _leafHashes) public view returns (bool) {
        return _proofs.multiProofVerify(_proofFlags, _rootHashes, _leafHashes);
    }

    function multiProofVerifyCalldata(bytes32[] memory _proofs, bool[] memory _proofFlags, bytes32[] memory _rootHashes, bytes32[] memory _leafHashes) public view returns (bool) {
        return _proofs.multiProofVerifyCalldata(_proofFlags, _rootHashes, _leafHashes);
    }

    function processMultiProof(bytes32[] memory _proofs, bool[] memory _proofFlags, bytes32[] memory _leafHashes) public view returns (bytes32) {
        return _proofs.processMultiProof(_proofFlags, _leafHashes);
    }

    function processMultiProofCalldata(bytes32[] memory _proofs, bool[] memory _proofFlags, bytes32[] memory _leafHashes) public view returns (bytes32) {
        return _proofs.processMultiProofCalldata(_proofFlags, _leafHashes);
    }

    function _hashPair(bytes32 _hash1, bytes32 _hash2) public pure returns (bytes32) {
        return _hash1.hashPair(_hash2);
    }

    function _efficientHash(bytes32 _hash1, bytes32 _hash2) public pure returns (bytes32) {
        return _hash1.efficientHash(_hash2);
    }
}