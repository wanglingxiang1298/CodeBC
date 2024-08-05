pragma solidity ^0.8.20;

interface IERC1820Registry {
    function setManager(address _addr, address _manager) external;
    function getManager(address _addr) external view returns (address);
    function setInterfaceImplementer(address _addr, bytes32 _interfaceHash, address _implementer) external;
    function getInterfaceImplementer(address _addr, bytes32 _interfaceHash) external view returns (address);
    function interfaceHash(string memory _interfaceName) external pure returns (bytes32);
    function updateERC165Cache(address _addr) external;
    function implementsERC165Interface(address _addr, bytes32 _interfaceHash) external view returns (bool);
    function implementsERC165InterfaceNoCache(address _addr, bytes32 _interfaceHash) external view returns (bool);

    event InterfaceImplementerSet(address indexed _addr, bytes32 indexed _interfaceHash, address indexed _implementer);
    event ManagerChanged(address indexed _addr, address indexed _manager);
}