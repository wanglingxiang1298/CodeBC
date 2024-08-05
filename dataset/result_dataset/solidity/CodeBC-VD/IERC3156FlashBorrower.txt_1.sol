pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(
        uint256 amount,
        address paidAsset,
        address receivedAsset,
        bytes calldata data
    ) external;
}