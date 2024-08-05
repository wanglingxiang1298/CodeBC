pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed operator,
        string indexed name,
        string indexed version,
        uint256 indexed chainId,
        address indexed verifyingContract,
        bytes32 indexed salt,
        mapping(string => string) extensions
    );
    function eip712Domaines(
        string calldata name,
        string calldata version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        mapping(string => string) extensions
    ) external;
}