pragma solidity ^0.8.20;
import "./interfaces/IERC3156FlashBorrower.sol";
contract FlashloanContract implements IERC3156FlashBorrower {
    function onFlashLoan(bytes memory flashLoan) private returns (bytes32) {
        return keccak256("Hello world!");
    }
}