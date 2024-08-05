pragma solidity ^0.8.20;
interface IERC20Errors {
    error ERC20InsufficientBalance(address sender, address receiver);
    error ERC20InvalidSender(address sender);
    error ERC20InvalidReceiver(address receiver);
    error ERC20InsufficientAllowance(address sender, address spender);
    error ERC20InvalidApprover(address approver);
    error ERC20InvalidSpender(address spender);
}
interface IERC721Errors {
    error ERC721InvalidOwner(uint256 tokenId);
    error ERC721NonexistentToken(uint256 tokenId);
    error ERC721IncorrectOwner(uint256 tokenId);
    error ERC721InvalidSender(uint256 tokenId);
    error ERC721InvalidReceiver(uint256 tokenId);
    error ERC721InsufficientApproval(uint256 tokenId);
    error ERC721InvalidApprover(uint256 tokenId);
    error ERC721InvalidOperator(uint256 tokenId);
}
interface IERC1155Errors {
    error ERC1155InsufficientBalance(address sender, address receiver);
    error ERC1155InvalidSender(address sender);
    error ERC1155InvalidReceiver(address receiver);
    error ERC1155MissingApprovalForAll(address operator);
    error ERC1155InvalidApprover(address approver);
    error ERC1155InvalidOperator(address operator);
    error ERC1155InvalidArrayLength(uint256 length);
}