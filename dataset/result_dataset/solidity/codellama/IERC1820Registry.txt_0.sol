pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1820/IERC1820Registry.sol";

contract MyERC1820Registry is IERC1820Registry {
    mapping(address => address) public managers;
    mapping(address => mapping(bytes32 => address)) public interfaceImplementers;

    event InterfaceImplementerSet(address indexed _address, bytes32 indexed _interfaceHash, address indexed _implementer);
    event ManagerChanged(address indexed _address, address indexed _newManager);

    function setManager(address _address, address _newManager) public {
        require(msg.sender == _address || msg.sender == _newManager, "Only the address or its manager can set the manager");
        managers[_address] = _newManager;
        emit ManagerChanged(_address, _newManager);
    }

    function getManager(address _address) public view returns (address) {
        return managers[_address];
    }

    function setInterfaceImplementer(address _address, bytes32 _interfaceHash, address _implementer) public {
        require(msg.sender == _address || msg.sender == _implementer, "Only the address or its implementer can set the implementer");
        interfaceImplementers[_address][_interfaceHash] = _implementer;
        emit InterfaceImplementerSet(_address, _interfaceHash, _implementer);
    }

    function getInterfaceImplementer(address _address, bytes32 _interfaceHash) public view returns (address) {
        return interfaceImplementers[_address][_interfaceHash];
    }

    function interfaceHash(string memory _interfaceName) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(_interfaceName));
    }

    function updateERC165Cache(address _address) public {
        // Implement the updateERC165Cache function here
    }

    function implementsERC165Interface(address _address, bytes32 _interfaceHash) public view returns (bool) {
        return interfaceImplementers[_address][_interfaceHash]!= address(0);
    }

    function implementsERC165InterfaceNoCache(address _address, bytes32 _interfaceHash) public view returns (bool) {
        return interfaceImplementers[_address][_interfaceHash]!= address(0);
    }
}
