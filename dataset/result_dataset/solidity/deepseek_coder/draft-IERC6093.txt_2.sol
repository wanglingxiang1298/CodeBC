pragma solidity ^0.8.20;
interface IERC20Errors {
    uint8 constant ERC20InsufficientBalance;
    uint8 constant ERC20InvalidSender;
    uint8 constant ERC20InvalidReceiver;
    uint8 constant ERC20InsufficientAllowance;
    uint8 constant ERC20InvalidApprover;
    uint8 constant ERC20InvalidSpender;
}
interface IERC721Errors {
    uint8 constant ERC721InvalidOwner;
    uint8 constant ERC721NonexistentToken;
    uint8 constant ERC721IncorrectOwner;
    uint8 constant ERC721InvalidSender;
    uint8 constant ERC721InvalidReceiver;
    uint8 constant ERC721InsufficientApproval;
    uint8 constant ERC721InvalidApprover;
    uint8 constant ERC721InvalidOperator;
}
interface IERC1155Errors {
    uint8 constant ERC1155InsufficientBalance;
    uint8 constant ERC1155InvalidSender;
    uint8 constant ERC1155InvalidReceiver;
    uint8 constant ERC1155MissingApprovalForAll;
    uint8 constant ERC1155InvalidApprover;
    uint8 constant ERC1155InvalidOperator;
    uint8 constant ERC1155InvalidArrayLength;
}