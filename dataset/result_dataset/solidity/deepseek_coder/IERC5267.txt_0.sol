pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 indexed typesHash,
        bytes32 indexed domainHash,
        uint256 chainId,
        address verifyingContract
    );
    function eip712Domaines() public view returns (bytes32[], string, string, uint256, address) {}
}