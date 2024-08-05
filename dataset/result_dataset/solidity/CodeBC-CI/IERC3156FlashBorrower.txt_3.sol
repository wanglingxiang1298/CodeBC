pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(bytes calldata data, uint256 amount, address token, bytes memory signature) external;
}