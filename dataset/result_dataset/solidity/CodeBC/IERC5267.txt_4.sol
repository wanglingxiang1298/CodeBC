pragma solidity ^0.8.20;
interface IERC5267 {
    event EIP712DomainChanged(
        address indexed _address,
        string _name,
        string _version,
        uint256 _chainId,
        address _verifyingContract,
        bytes32 _salt,
        string _extensions
    );
    function eip712Domaines(
        string calldata _name,
        string calldata _version,
        uint256 _chainId,
        address _verifyingContract,
        bytes32 _salt,
        string calldata _extensions
    ) external;
}
