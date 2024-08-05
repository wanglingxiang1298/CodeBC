pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(
        uint256 amount,
        address paidTo,
        bytes32 collateralHash,
        bytes memory collateralSig
    ) external;
}
