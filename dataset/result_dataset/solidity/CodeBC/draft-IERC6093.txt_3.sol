pragma solidity ^0.8.20;
interface IERC20Errors {
    enum Error {
        ERC20InsufficientBalance,
        ERC20InvalidSender,
        ERC20InvalidReceiver,
        ERC20InsufficientAllowance,
        ERC20InvalidApprover,
        ERC20InvalidSpender
    }
    event ERC20TransferFailed(address token, Error err, address msgSender, address account, uint256 amount);
    event ERC20ApprovalFailed(address token, Error err, address msgSender, address account);
}
interface IERC721Errors {
    enum Error {
        ERC721InvalidOwner,
        ERC721NonexistentToken,
        ERC721IncorrectOwner,
        ERC721InvalidSender,
        ERC721InvalidReceiver,
        ERC721InsufficientApproval
    }
    event ERC721TransferFailed(address token, Error err, address msgSender, address from, address to, uint256 tokenId);
    event ERC721ApprovalFailed(address token, Error err, address msgSender, address account, uint256 tokenId);
}
interface IERC1155Errors {
    enum Error {
        ERC1155InsufficientBalance,
        ERC1155InvalidSender,
        ERC1155InvalidReceiver,
        ERC1155MissingApprovalForAll,
        ERC1155InvalidApprover,
        ERC1155InvalidOperator,
        ERC1155InvalidArrayLength
    }
    event ERC1155TransferFailed(address token, Error err, address msgSender, address from, address to, uint256 tokenId, uint256 amount);
    event ERC1155ApprovalFailed(address token, Error err, address msgSender, address account, uint256 tokenId);
}

