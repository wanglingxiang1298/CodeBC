pragma solidity ^0.8.20;
library MerkleProof {
    function verify(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bool) {
        bytes32 hashValue = leaf;
        for (uint i = 0; i < proof.length; i++) {
            if (proof[i].length > 0) {
                hashValue = _hashPair(hashValue, proof[i]);
            }
        }
        return hashValue == root;
    }
    function verifyCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal view returns (bool) {
        bytes32 hashValue = leaf;
        for (uint i = 0; i < proof.length; i++) {
            if (proof[i].length > 0) {
                hashValue = _hashPair(hashValue, proof[i]);
            }
        }
        return hashValue == root;
    }
    function processProof(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal pure returns (bytes32) {
        bytes32 hashValue = leaf;
        for (uint i = 0; i < proof.length; i++) {
            if (proof[i].length > 0) {
                hashValue = _hashPair(hashValue, proof[i]);
            }
        }
        return hashValue == root ? hashValue : uint256(0);
    }
    function processProofCalldata(bytes32[] memory proof, bytes32 root, bytes32 leaf) internal view returns (bytes32) {
        bytes32 hashValue = leaf;
        for (uint i = 0; i < proof.length; i++) {
            if (proof[i].length > 0) {
                hashValue = _hashPair(hashValue, proof[i]);
            }
        }
        return hashValue == root ? hashValue : uint256(0);
    }
    function multiProofVerify(bytes32[] memory proof, uint256[] memory flags, bytes32[] memory root, bytes32[] memory leaf) internal pure returns (bool) {
        bytes32 rootHash = root[0];
        for (uint i = 1; i < proof.length; i++) {
            if (flags[i] == 0) {
                if (proof[i].length > 0) {
                    rootHash = _hashPair(rootHash, proof[i]);
                }
            } else {
                if (proof[i].length > 0) {
                    bytes32 hashValue = leaf[i];
                    for (uint j = 0; j < proof[i].length; j++) {
                        if (proof[i].length > 0) {
                            hashValue = _hashPair(hashValue, proof[i]);
                        }
                    }
                    rootHash = _hashPair(rootHash, hashValue);
                }
            }
        }
        return rootHash == root[0] ? true : false;
    }
    function multiProofVerifyCalldata(bytes32[] memory proof, uint256[] memory flags, bytes32[] memory root, bytes32[] memory leaf) internal view returns (bool) {
        bytes32 rootHash = root[0];
        for (uint i = 1; i < proof.length; i++) {
            if (flags[i] == 0) {
                if (proof[i].length > 0) {
                    rootHash = _hashPair(rootHash, proof[i]);
                }
            } else {
                if (proof[i].length > 0) {
                    bytes32 hashValue = leaf[i];
                    for (uint j = 0; j < proof[i].length; j++) {
                        if (proof[i].length > 0) {
                            hashValue = _hashPair(hashValue, proof[i]);
                        }
                    }
                    rootHash = _hashPair(rootHash, hashValue);
                }
            }
        }
        return rootHash == root[0] ? true : false;
    }
    function processMultiProof(bytes32[] memory proof, uint256[] memory flags, bytes32[] memory leaf) internal pure returns (bytes32) {
        bytes32 rootHash = leaf[0];
        for (uint i = 1; i < proof.length; i++) {
            if (flags[i] == 0) {
                if (proof[i].length > 0) {
                    rootHash = _hashPair(rootHash, proof[i]);
                }
            } else {
                if (proof[i].length > 0) {
                    bytes32 hashValue = leaf[i];
                    for (uint j = 0; j < proof[i].length; j++) {
                        if (proof[i].length > 0) {
                            hashValue = _hashPair(hashValue, proof[i]);
                        }
                    }
                    rootHash = _hashPair(rootHash, hashValue);
                }
            }
        }
        return rootHash;
    }
    function processMultiProofCalldata(bytes32[] memory proof, uint256[] memory flags, bytes32[] memory leaf) internal view returns (bytes32) {
        bytes32 rootHash = leaf[0];
        for (uint i = 1; i < proof.length; i++) {
            if (flags[i] == 0) {
                if (proof[i].length > 0) {
                    rootHash = _hashPair(rootHash, proof[i]);
                }
            } else {
                if (proof[i].length > 0) {
                    bytes32 hashValue = leaf[i];
                    for (uint j = 0; j < proof[i].length; j++) {
                        if (proof[i].length > 0) {
                            hashValue = _hashPair(hashValue, proof[i]);
                        }
                    }
                    rootHash = _hashPair(rootHash, hashValue);
                }
            }
        }
        return rootHash;
    }
    private function _hashPair(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a == (bytes32)(a ^ b) ? a : _hashPair(a, b);
    }
    private function _efficientHash(bytes32 a, bytes32 b) internal pure returns (bytes32) {
        return a == (bytes32)(a ^ b) ? a : _efficientHash(a, b);
    }
}