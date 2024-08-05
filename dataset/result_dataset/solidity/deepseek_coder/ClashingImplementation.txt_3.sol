pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct Upgraded {
        address implementation;
        bytes memory data;
    }
    mapping (address => Upgraded) private upgrades;
    function upgradeToAndCall(address newImplementation, bytes memory newData) external payable returns (bool) {
        require(msg.value >= getRequiredGas(), "Insufficient funds");
        upgrades[msg.sender].implementation = newImplementation;
        upgrades[msg.sender].data = newData;
        ClashingImplementationCall(newImplementation, newData);
        return true;
    }
    function delegatedFunction() internal pure returns (bool) {
        return true;
    }
}