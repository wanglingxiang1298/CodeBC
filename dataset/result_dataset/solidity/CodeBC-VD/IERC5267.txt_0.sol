pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed account,
        address verifyingContract,
        string extensions
    );
    function eip712Domaines(
        address verifyingContract,
        string memory extensions,
        string memory name,
        string memory version
    ) external returns (
        string memory fields,
        uint256 chainId,
        uint256 salt
    );
}