pragma solidity ^0.8.20;
import "./IERC1967.sol";
contract SmartContract implements IERC1967 {
    address public contractAdministrator;
    constructor(uint256 initialAdmin) {
        contractAdministrator = initialAdmin;
    }
    function upgrade(address newContractAddress) external only(isContractAdministrator(msg.sender)) {
        IERC1967 newContract = IERC1967(newContractAddress);
        newContract.upgrade(contractAddress);
        contractAdministrator = newContractAddress;
        emit Upgraded();
    }
    function setContractAdministrator(address newContractAdministrator) external only(isContractAdministrator(msg.sender)) {
        contractAdministrator = newContractAdministrator;
        emit AdminChanged(newContractAdministrator);
    }
    function isContractAdministrator(address account) internal view returns (bool) {
        return account == contractAdministrator;
    }
    event Upgraded;
    event AdminChanged(address newContractAdministrator);
}