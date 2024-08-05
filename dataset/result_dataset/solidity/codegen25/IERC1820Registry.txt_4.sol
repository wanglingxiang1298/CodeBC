pragma solidity ^0.8.20;
interface IERC1820Registry {
    function setManager(address _manager) external;
    function getManager(address _owner) external view returns (address);
    function setInterfaceImplementer(bytes32 _interfaceId, address _implementer) external;
    function getInterfaceImplementer(bytes32 _interfaceId, address _owner) external view returns (address);
    function interfaceHash(string memory _interfaceName) external view returns (bytes32);
    function updateERC165Cache(address _address) external;
    function implementsERC165Interface(address _address, bytes4 _interfaceId) external view returns (bool);
    function implementsERC165InterfaceNoCache(address _address, bytes4 _interfaceId) external view returns (bool);
    event InterfaceImplementerSet(address indexed _address, address _implementer);
    event ManagerChanged(address indexed _address, address _manager);
}