pragma solidity ^0.8.20;
interface IERC1820Registry {
    function setManager(address _target, address _manager)
        external
        returns (bytes4);
    function getManager(address _target)
        external
        view
        returns (address);
    function setInterfaceImplementer(
        address _target,
        bytes4 _interfaceId,
        address _implementer
    ) external returns (bytes4);
    function getInterfaceImplementer(address _target, bytes4 _interfaceId)
        external
        view
        returns (address);
    function interfaceHash(string calldata _interfaceName)
        external
        pure
        returns (bytes32);
    function updateERC165Cache(address _target, bytes4 _interfaceId)
        external
        returns (bytes4);
    function implementsERC165Interface(address _target, bytes4 _interfaceId)
        external
        view
        returns (bool);
    function implementsERC165InterfaceNoCache(
        address _target,
        bytes4 _interfaceId
    ) external view returns (bool);
    event InterfaceImplementerSet(
        address indexed target,
        bytes4 indexed interfaceId,
        address indexed implementer
    );
    event ManagerChanged(address indexed target, address indexed manager);
}
