pragma solidity ^0.8.20;

interface IERC5267 {
    event EIP712DomainChanged(
        address indexed domain,
        string indexed name,
        uint256 indexed version,
        uint256 indexed chainId,
        address indexed verifyingContract,
        bytes32 indexed salt,
        bytes extensions
    );

    function eip712Domaines(
        address domain,
        string memory name,
        uint256 version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        bytes memory extensions
    ) public view returns (
        fields,
        name,
        version,
        chainId,
        verifyingContract,
        salt,
        extensions
    ) {
        // Get the EIP712 domain information
        (
            fields,
            name,
            version,
            chainId,
            verifyingContract,
            salt,
            extensions
        ) = EIP712Domain(domain).getDomainInfo();

        // Return the domain information
        return (
            fields,
            name,
            version,
            chainId,
            verifyingContract,
            salt,
            extensions
        );
    }
}