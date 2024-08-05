pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleVerifier {
    using(MerkleProof = "0x..."); // Importing the MerkleProof library
    enum MerkleProofError {
        "MerkleProofInvalidMultiproof"
    }
    function verify(bytes32[] memory proof, bytes32 root) public pure returns (bool) {
        bytes32 computedRoot = processProof(proof);
        return computedRoot == root;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root) public view returns (bool) {
        bytes32 computedRoot = processProofCalldata(proof);
        return computedRoot == root;
    }
    function processProof(bytes32[] memory proof) public pure returns (bytes32) {
        bytes32[] memory hashes = new bytes32[](proof.length);
        for (uint i = 0; i < proof.length; i++) {
            hashes[i] = proof[i];
        }
        return processMultiProof(hashes, new bool[](proof.length), new bytes32[](proof.length));
    }
    function processProofCalldata(bytes32[] memory proof) public view returns (bytes32) {
        bytes32[] memory hashes = new bytes32[](proof.length);
        for (uint i = 0; i < proof.length; i++) {
            hashes[i] = proof[i];
        }
        return processMultiProofCalldata(hashes, new bool[](proof.length), new bytes32[](proof.length));
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public pure returns (bool) {
        bytes32[] memory combinedHashes = new bytes32[](proofs.length);
        for (uint i = 0; i < proofs.length; i++) {
            combinedHashes[i] = processMultiProof([proofs[i]], [proofFlags[i]], [rootHashes[i]]);
        }
        return multiProofVerifyCalldata(combinedHashes, [proofFlags], [rootHashes], [leafHashes]);
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bool) {
        bytes32[] memory combinedHashes = new bytes32[](proofs.length);
        for (uint i = 0; i < proofs.length; i++) {
            combinedHashes[i] = processMultiProofCalldata([proofs[i]], [proofFlags[i]], [rootHashes[i]]);
        }
        return multiProofVerify(combinedHashes, [proofFlags], [rootHashes], [leafHashes]);
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes) public pure returns (bytes32) {
        bytes32[] memory combinedHashes = new bytes32[](proofs.length);
        for (uint i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                combinedHashes[i] = proofs[i];
            } else {
                combinedHashes[i] = processMultiProof([proofs[i]], [proofFlags[i]], [rootHashes[i]]);
            }
        }
        return processMultiProofCalldata(combinedHashes, [proofFlags], [rootHashes]);
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes) public view returns (bytes32) {
        bytes32[] memory combinedHashes = new bytes32[](proofs.length);
        for (uint i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                combinedHashes[i] = proofs[i];
            } else {
                combinedHashes[i] = processMultiProofCalldata([proofs[i]], [proofFlags[i]], [rootHashes[i]]);
            }
        }
        return processMultiProof(combinedHashes, [proofFlags], [rootHashes]);
    }
    function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }
    function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        bytes32[] memory inputs = new bytes32[](2);
        inputs[0] = a;
        inputs[1] = b;
        bytes32 output;
        assembly
        .call(
            [MerkelProof.hash.address, "efficientHash", inputs.length, inputs.map(a => a.pack()).slice(0, 32), inputs.map(a => a.pack()).slice(32)],
            output.pack()
        )
        .revertWithMessage(new bytes(32, "0x..."));
        return output;
    }
}