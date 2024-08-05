pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(bytes calldata data, uint256 value, address sender, address recipient, uint256 amount) external returns (bytes32 result);
}
