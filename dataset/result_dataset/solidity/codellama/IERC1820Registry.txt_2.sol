pragma solidity ^0.8.20;

interface IERC1820Registry {
    function setManager(address addr, address newManager) external;
    function getManager(address addr) external view returns (address);
    function setInterfaceImplementer(address addr, bytes32 interfaceHash, address implementer) external;
    function getInterfaceImplementer(address addr, bytes32 interfaceHash) external view returns (address);
    function interfaceHash(string memory interfaceName) external pure returns (bytes32);
    function updateERC165Cache(address addr) external;
    function implementsERC165Interface(address addr, bytes32 interfaceHash) external view returns (bool);
    function implementsERC165InterfaceNoCache(address addr, bytes32 interfaceHash) external view returns (bool);

    event InterfaceImplementerSet(address indexed addr, bytes32 indexed interfaceHash, address indexed implementer);
    event ManagerChanged(address indexed addr, address indexed newManager);
}