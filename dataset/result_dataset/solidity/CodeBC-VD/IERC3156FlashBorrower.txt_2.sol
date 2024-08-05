pragma solidity ^0.8.20;
interface IERC3156FlashBorrower {
    function onFlashLoan(
        address _reserve,
        uint256 _amount,
        uint256 _totalFee,
        bytes32 _reserveMetadata,
        bytes32 _params,
        uint256 _deadline
    ) external;
}
