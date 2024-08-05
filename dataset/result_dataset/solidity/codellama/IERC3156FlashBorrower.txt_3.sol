pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC3156FlashBorrower.sol";

contract MyFlashBorrower is ERC3156FlashBorrower {
    function onFlashLoan(address token, uint256 amount, bytes calldata data) external override returns (bytes32) {
        // Process the flash loan and return a value of type bytes32
        //...
        return bytes32(0);
    }
}