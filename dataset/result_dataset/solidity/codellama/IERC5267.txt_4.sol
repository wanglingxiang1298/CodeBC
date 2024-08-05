pragma solidity ^0.8.20;

interface IERC5267 {
    event EIP712DomainChanged(
        address indexed domain,
        string name,
        uint256 version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        bytes32 extensions
    );

    function eip712Domaines(address domain) external view returns (
        fields,
        name,
        version,
        chainId,
        verifyingContract,
        salt,
        extensions
    ) {
        // Implement the logic to retrieve the EIP712 domain information
        // from the blockchain and return it as a tuple.
    }
}