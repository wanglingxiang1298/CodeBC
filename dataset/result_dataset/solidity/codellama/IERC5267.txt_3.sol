pragma solidity ^0.8.20;

interface IERC5267 {
    event EIP712DomainChanged(
        address indexed domain,
        uint256 indexed chainId,
        address indexed verifyingContract,
        bytes32 salt
    );

    function eip712Domaines(
        address domain,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt
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