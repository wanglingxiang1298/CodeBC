pragma solidity ^0.8.20;
interface IERC20Errors {
    uint256 ERC20InsufficientBalance;
    uint256 ERC20InvalidSender;
    uint256 ERC20InvalidReceiver;
    uint256 ERC20InsufficientAllowance;
    uint256 ERC20InvalidApprover;
    uint256 ERC20InvalidSpender;
}
interface IERC721Errors {
    uint256 ERC721InvalidOwner;
    uint256 ERC721NonexistentToken;
    uint256 ERC721IncorrectOwner;
    uint256 ERC721InvalidSender;
    uint256 ERC721InvalidReceiver;
    uint256 ERC721InsufficientApproval;
    uint256 ERC721InvalidApprover;
    uint256 ERC721InvalidOperator;
}
interface IERC1155Errors {
    uint256 ERC1155InsufficientBalance;
    uint256 ERC1155InvalidSender;
    uint256 ERC1155InvalidReceiver;
    uint256 ERC1155MissingApprovalForAll;
    uint256 ERC1155InvalidApprover;
    uint256 ERC1155InvalidOperator;
    uint256 ERC1155InvalidArrayLength;
}