pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(bytes32 memory flashLoan) returns (bytes32 memory);
}