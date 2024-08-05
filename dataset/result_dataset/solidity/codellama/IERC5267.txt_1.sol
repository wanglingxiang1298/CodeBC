pragma solidity ^0.8.20;

interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed domain,
        bytes32 indexed name,
        bytes32 indexed version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        bytes32 extensions
    );

    function eip712Domaines(
        bytes32 domain,
        bytes32 name,
        bytes32 version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        bytes32 extensions
    ) external view returns (
        bytes32 fields,
        bytes32 name,
        bytes32 version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        bytes32 extensions
    );
}