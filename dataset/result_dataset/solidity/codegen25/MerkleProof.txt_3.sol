pragma solidity ^0.8.20;
import "./MerkleProof.sol";
contract MerkleVerifier {
    using SafeMath for uint256;
    mapping(uint256 => MerkleProof) public proofs;
    mapping(uint256 => bytes32) public rootHashes;
    function verify(uint256[] memory proof, bytes32 rootHash, bytes32 leafHash) public pure returns (bool) {
        bytes32[] memory nodes;
        bytes32 currentHash;
        for (uint256 i = 0; i < proof.length; i++) {
            nodes = proof[i];
            currentHash = _hashPair(nodes[0], nodes[1]);
            for (uint256 j = 2; j < nodes.length; j++) {
                currentHash = _hashPair(currentHash, nodes[j]);
            }
        }
        return currentHash == rootHash && leafHash == currentHash;
    }
    function verifyCalldata(uint256[] memory proof, bytes32 rootHash, bytes32 leafHash) public view returns (bool) {
        bytes32[] memory nodes;
        bytes32 currentHash;
        for (uint256 i = 0; i < proof.length; i++) {
            nodes = proof[i];
            currentHash = _hashPair(nodes[0], nodes[1]);
            for (uint256 j = 2; j < nodes.length; j++) {
                currentHash = _hashPair(currentHash, nodes[j]);
            }
        }
        return currentHash == rootHash && leafHash == currentHash;
    }
    function processProof(uint256[] memory proof, bytes32 rootHash, bytes32 leafHash) public view returns (bytes32) {
        bytes32[] memory nodes;
        bytes32 currentHash;
        for (uint256 i = 0; i < proof.length; i++) {
            nodes = proof[i];
            currentHash = _hashPair(nodes[0], nodes[1]);
            for (uint256 j = 2; j < nodes.length; j++) {
                currentHash = _hashPair(currentHash, nodes[j]);
            }
        }
        require(currentHash == rootHash, "Invalid root hash");
        require(leafHash == currentHash, "Invalid leaf hash");
        return currentHash;
    }
    function processProofCalldata(uint256[] memory proof, bytes32 rootHash, bytes32 leafHash) public view returns (bytes32) {
        bytes32[] memory nodes;
        bytes32 currentHash;
        for (uint256 i = 0; i < proof.length; i++) {
            nodes = proof[i];
            currentHash = _hashPair(nodes[0], nodes[1]);
            for (uint256 j = 2; j < nodes.length; j++) {
                currentHash = _hashPair(currentHash, nodes[j]);
            }
        }
        require(currentHash == rootHash, "Invalid root hash");
        require(leafHash == currentHash, "Invalid leaf hash");
        return currentHash;
    }
    function multiProofVerify(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                require(proofs[i].verify(rootHashes[i], leafHashes[i]), "Invalid proof");
            }
        }
        return true;
    }
    function multiProofVerifyCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bool) {
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                require(proofs[i].verify(rootHashes[i], leafHashes[i]), "Invalid proof");
            }
        }
        return true;
    }
    function processMultiProof(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bytes32) {
        bytes32 currentHash;
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                currentHash = proofs[i].verify(rootHashes[i], leafHashes[i]);
            }
        }
        return currentHash;
    }
    function processMultiProofCalldata(bytes32[] memory proofs, bool[] memory proofFlags, bytes32[] memory rootHashes, bytes32[] memory leafHashes) public view returns (bytes32) {
        bytes32 currentHash;
        for (uint256 i = 0; i < proofs.length; i++) {
            if (proofFlags[i]) {
                currentHash = proofs[i].verify(rootHashes[i], leafHashes[i]);
            }
        }
        return currentHash;
    }
    private function _hashPair(bytes32 a, bytes32 b) public pure returns (bytes32) {
        return a == b ? keccak256(abi.encodePacked(a, a)) : keccak256(abi.encodePacked(a, b));
    }
    private function _efficientHash(bytes32 a, bytes32 b) public pure returns (bytes32) {
        bytes32[2] memory h;
        bytes32 mask;
        uint256 w;
        uint256 t;
        uint8[64] memory data;
        uint8[64] memory r;
        uint8[64] memory s;
        h[0] = a;
        h[1] = b;
        mask = keccak256(abi.encodePacked(uint256(1)));
        w = uint256(keccak256(abi.encodePacked(h[0], h[1])));
        t = w & ~mask;
        data[0] = uint8(0x00);
        data[1] = uint8(0x01);
        data[2] = uint8(0x00);
        data[3] = uint8(0x02);
        data[4] = uint8(0x00);
        data[5] = uint8(0x10);
        data[6] = uint8(0x00);
        data[7] = uint8(0x20);
        data[8] = uint8(0x00);
        data[9] = uint8(0x00);
        data[10] = uint8(0x00);
        data[11] = uint8(0x00);
        data[12] = uint8(0x00);
        data[13] = uint8(0x00);
        data[14] = uint8(0x00);
        data[15] = uint8(0x00);
        data[16] = uint8(0x00);
        data[17] = uint8(0x00);
        data[16] = uint8(0x01);
        data[11);
        data[11
        data[11;
        data[11
        data[11
        data[11
        data[11[11
        data[11
        data[11[11[11
        data[11[11