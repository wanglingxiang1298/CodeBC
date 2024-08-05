pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed verifyingContract,
        bytes32 indexed domainSeparator
    );
    function eip712Domain() external view returns (
        bytes32 domainSeparator,
        address verifyingContract
    );
}
