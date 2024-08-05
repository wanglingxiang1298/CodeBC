pragma solidity ^0.8.20;

interface IERC1820Registry {
    function setManager(address _address, address _manager) external;
    function getManager(address _address) external view returns (address);
    function setInterfaceImplementer(address _address, bytes32 _interfaceHash, address _implementer) external;
    function getInterfaceImplementer(address _address, bytes32 _interfaceHash) external view returns (address);
    function interfaceHash(string memory _interfaceName) external pure returns (bytes32);
    function updateERC165Cache(address _address) external;
    function implementsERC165Interface(address _address, bytes32 _interfaceHash) external view returns (bool);
    function implementsERC165InterfaceNoCache(address _address, bytes32 _interfaceHash) external view returns (bool);

    event InterfaceImplementerSet(address indexed _address, bytes32 indexed _interfaceHash, address indexed _implementer);
    event ManagerChanged(address indexed _address, address indexed _manager);
}