pragma solidity ^0.8.20;
interface IERC1820Registry {
    function setManager(address _newManager, address _account) external;
    function getManager(address _account) external view returns (address _manager);
    function setInterfaceImplementer(address _account, bytes32 _interfaceHash, address _implementer) external;
    function getInterfaceImplementer(address _account, bytes32 _interfaceHash) external view returns (address _implementer);
    function interfaceHash(string memory _interfaceName) external pure returns (bytes32 _interfaceHash);
    function updateERC165Cache(address _account, bytes4 _interfaceId) external;
    function implementsERC165Interface(address _account, bytes4 _interfaceId) external view returns (bool _implementsInterface);
    function implementsERC165InterfaceNoCache(address _account, bytes4 _interfaceId) external view returns (bool _implementsInterface);
    event InterfaceImplementerSet(address indexed _account, bytes32 indexed _interfaceHash, address indexed _implementer);
    event ManagerChanged(address indexed _oldManager, address indexed _newManager, address indexed _account);
}