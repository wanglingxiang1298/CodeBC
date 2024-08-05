pragma solidity ^0.8.20;

interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed domainHash,
        bytes32 indexed domainSeparator,
        bytes32 indexed domainSalt
    );

    function eip712Domaines(
        bytes32 domainHash,
        bytes32 domainSeparator,
        bytes32 domainSalt
    ) external view returns (
        fields,
        name,
        version,
        chainId,
        verifyingContract,
        salt,
        extensions
    );
}