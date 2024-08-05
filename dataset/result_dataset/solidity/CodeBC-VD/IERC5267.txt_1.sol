pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed account,
        uint256 chainId,
        string indexed name,
        string indexed version,
        string indexed verifyingContract,
        bytes32 indexed salt,
        mapping(string => string) extensions
    );
    function eip712Domaines(
        address account,
        uint256 chainId,
        string calldata name,
        string calldata version,
        string calldata verifyingContract,
        bytes32 salt,
        mapping(string => string) extensions
    ) external;
}