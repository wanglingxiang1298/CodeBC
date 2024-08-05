pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed domainId,
        string indexed name,
        string indexed version,
        uint256 indexed chainId,
        address indexed verifyingContract,
        uint256 salt,
        mapping(string => string) extensions
    );
    function eip712Domaines(bytes32 domainId) external view returns (
        string memory name,
        string memory version,
        uint256 chainId,
        address verifyingContract,
        uint256 salt,
        mapping(string => string) extensions
    );
}
