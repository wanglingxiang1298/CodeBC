pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed domain,
        bytes32 indexed salt,
        bytes32 indexed verifyingContract,
        string indexed name,
        string indexed version,
        uint256 chainId,
        mapping(string => string) extensions
    );
    function eip712Domaines(address domain) public view returns (
        string memory name,
        string memory version,
        uint256 chainId,
        address verifyingContract,
        bytes32 salt,
        mapping(string => string) extensions
    );
}