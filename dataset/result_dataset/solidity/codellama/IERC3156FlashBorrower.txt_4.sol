pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC3156FlashBorrower.sol";

contract MyFlashLoanBorrower is ERC3156FlashBorrower {
    // The address of the token contract that will be used for the flash loan
    address public tokenAddress;

    // The amount of tokens that will be borrowed
    uint256 public borrowAmount;

    // The address of the recipient of the flash loan
    address public recipient;

    // The amount of tokens that will be transferred to the recipient
    uint256 public transferAmount;

    // The amount of tokens that will be repaid to the lender
    uint256 public repayAmount;

    // The address of the lender
    address public lender;

    // The timestamp of the flash loan
    uint256 public flashLoanTimestamp;

    constructor(address _tokenAddress, uint256 _borrowAmount, address _recipient, uint256 _transferAmount, uint256 _repayAmount, address _lender) public {
        tokenAddress = _tokenAddress;
        borrowAmount = _borrowAmount;
        recipient = _recipient;
        transferAmount = _transferAmount;
        repayAmount = _repayAmount;
        lender = _lender;
        flashLoanTimestamp = block.timestamp;
    }

    function onFlashLoan(address _tokenAddress, uint256 _borrowAmount, address _recipient, uint256 _transferAmount, uint256 _repayAmount, address _lender) public override {
        // Check that the flash loan is for the correct token
        require(_tokenAddress == tokenAddress, "Invalid token address");

        // Check that the flash loan is for the correct amount
        require(_borrowAmount == borrowAmount, "Invalid borrow amount");

        // Check that the flash loan is for the correct recipient
        require(_recipient == recipient, "Invalid recipient");

        // Check that the flash loan is for the correct transfer amount
        require(_transferAmount == transferAmount, "Invalid transfer amount");

        // Check that the flash loan is for the correct repay amount
        require(_repayAmount == repayAmount, "Invalid repay amount");

        // Check that the flash loan is from the correct lender
        require(_lender == lender, "Invalid lender");

        // Perform the flash loan
        IERC20(_tokenAddress).transferFrom(lender, recipient, transferAmount);

        // Repay the flash loan
        IERC20(_tokenAddress).transferFrom(recipient, lender, repayAmount);

        // Return the flash loan
        IERC20(_tokenAddress).transferFrom(recipient, lender, transferAmount);
    }
}