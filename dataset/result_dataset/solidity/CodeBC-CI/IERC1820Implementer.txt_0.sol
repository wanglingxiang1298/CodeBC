pragma solidity ^0.8.20;
contract ERC1820Registry {
    mapping(bytes32 => mapping(address => uint256)) private _implementations;
    constructor() public {
        _implementations[IERC1820Implementer.interfaceHash] = address(this);
    }
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) public view returns (bool) {
        uint256 sendable = _implementations[interfaceHash][account];
        return sendable!= 0;
    }
    function _setImplementation(bytes32 interfaceHash, address account, uint256 sendable) internal {
        require(sendable!= 0, "ERC1820Registry: cannot set implementation to zero");
        _implementations[interfaceHash][account] = sendable;
    }
}
