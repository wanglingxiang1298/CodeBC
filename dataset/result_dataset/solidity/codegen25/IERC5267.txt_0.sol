pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed typesHash,
        bytes32 indexed domainHash,
        string memory message
    );
}