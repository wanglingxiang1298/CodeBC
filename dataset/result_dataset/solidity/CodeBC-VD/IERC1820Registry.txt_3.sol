pragma solidity ^0.8.20;
interface IERC1820Registry {
    function setManager(address _target, address _manager) external;
    function getManager(address _target) external view returns (address);
    function setInterfaceImplementer(address _target, bytes4 _interfaceHash, address _implementer) external;
    function getInterfaceImplementer(address _target, bytes4 _interfaceHash) external view returns (address);
    function interfaceHash(string calldata _interfaceName) external pure returns (bytes4);
    function updateERC165Cache(address _target, bytes4 _interfaceHash, bool _mustHaveCode) external;
    function implementsERC165Interface(address _target, bytes4 _interfaceHash) external view returns (bool);
    function implementsERC165InterfaceNoCache(address _target, bytes4 _interfaceHash) external view returns (bool);
    event InterfaceImplementerSet(address indexed _target, bytes4 indexed _interfaceHash, address indexed _implementer);
    event ManagerChanged(address indexed _target, address indexed _manager);
}
