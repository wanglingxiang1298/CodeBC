pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(
        address _reserve,
        uint256 _amount,
        uint256 _fee,
        bytes32 _metadata
    ) external;
}
