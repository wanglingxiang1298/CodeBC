pragma solidity ^0.8.20;
contract ERC1820Implementer is IERC1820Implementer {
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) public view override returns (bytes32) {
        if(interfaceHash == IERC165(account).supportsInterface(interfaceHash)) {
            return nterface(interfaceHash)) {
            return 1;
        } else {
            return 0;
        }
    }
}

