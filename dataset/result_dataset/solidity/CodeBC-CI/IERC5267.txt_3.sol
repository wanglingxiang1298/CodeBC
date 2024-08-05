pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed domainId,
        bytes32 indexed name,
        bytes32 indexed version,
        uint256 indexed chainId,
        address indexed verifyingContract,
        uint256 salt,
        mapping(bytes32 => bytes32) extensions
    );
    function eip712Domaines(bytes32 domainId) external view returns (
        bytes32 fields,
        bytes32 name,
        bytes32 version,
        uint256 chainId,
        address verifyingContract,
        uint256 salt,
        mapping(bytes32 => bytes32) extensions
    );
}
