pragma solidity ^0.8.20;
interface IERC20Errors {
    error ERC20InsufficientBalance();
    error ERC20InvalidSender();
    error ERC20InvalidReceiver();
    error ERC20InsufficientAllowance();
    error ERC20InvalidApprover();
    error ERC20InvalidSpender();
}
interface IERC721Errors {
    error ERC721InvalidOwner();
    error ERC721NonexistentToken();
    error ERC721IncorrectOwner();
    error ERC721InvalidSender();
    error ERC721InvalidReceiver();
    error ERC721InsufficientApproval();
    error ERC721InvalidApprover();
    error ERC721InvalidOperator();
}
interface IERC1155Errors {
    error ERC1155InsufficientBalance();
    error ERC1155InvalidSender();
    error ERC1155InvalidReceiver();
    error ERC1155MissingApprovalForAll();
    error ERC1155InvalidApprover();
    error ERC1155InvalidOperator();
    error ERC1155InvalidArrayLength();
}
