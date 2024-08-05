pragma solidity ^0.8.20;

interface IERC3156FlashBorrower {
    function onFlashLoan(address sender, uint256 amount, bytes calldata data) external;
}