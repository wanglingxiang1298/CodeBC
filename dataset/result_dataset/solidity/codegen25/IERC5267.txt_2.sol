pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        bytes32 v,
        bytes32 r,
        bytes32 s,
        string name,
        string version,
        uint256 chainId,
        address verifyingContract
    );
    function eip712Domaines() view private returns (bytes32[], string, string, uint256, address) public view;
}