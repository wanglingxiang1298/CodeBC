pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed verifyingContract,
        bytes32 indexed domainNameHash,
        bytes32 indexed domainVersionHash
    );
    function eip712Domaines(
        address verifyingContract,
        bytes32 domainNameHash,
        bytes32 domainVersionHash
    ) external returns (
        bytes32 fields,
        bytes32 name,
        bytes32 version,
        bytes32 chainId,
        address verifyingContract_,
        bytes32 salt,
        bytes32 extensions
    );
}
