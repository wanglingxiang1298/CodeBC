pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed _from,
        address indexed _to,
        bytes32 indexed _name,
        bytes32 indexed _version,
        uint256 indexed _chainId,
        address indexed _verifyingContract,
        bytes32 indexed _salt,
        mapping(bytes32 => bytes32) _extensions
    );
    function eip712Domaines(
        bytes32 _name,
        bytes32 _version,
        uint256 _chainId,
        address _verifyingContract,
        bytes32 _salt,
        mapping(bytes32 => bytes32) memory _extensions
    ) external;
}