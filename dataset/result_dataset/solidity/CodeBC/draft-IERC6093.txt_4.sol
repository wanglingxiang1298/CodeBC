pragma solidity ^0.8.20;
interface IERC20Errors {
    enum Error {
        None,
        InsufficientBalance,
        InvalidSender,
        InsufficientAllowance,
        InvalidApprover
    }
    event TransferError(Error err, address indexed token, address indexed from, address indexed to, uint256 amount);
    function transfer(address token, address from, address to, uint256 amount) external returns (Error err);
}
interface IERC721Errors {
    enum Error {
        None,
        InvalidOwner,
        NonexistentToken,
        IncorrectOwner,
        InvalidSender,
        InvalidReceiver,
        InsufficientApproval
    }
    event TransferError(Error err, address indexed token, address indexed from, address indexed to, uint256 tokenId);
    function safeTransferFrom(address token, address from, address to, uint256 tokenId) external returns (Error err);
    function safeApprove(address token, address to, uint256 tokenId) external returns (Error err);
}
interface IERC1155Errors {
    enum Error {
        None,
        InsufficientBalance,
        InvalidSender,
        InvalidReceiver,
        MissingApprovalForAll,
        InvalidApprover
    }
    event TransferSingleError(Error err, address indexed operator, address indexed from, address indexed to, uint256 id, uint256 value);
    function safeTransferFrom(address from, address to, uint256 id, uint256 value, bytes calldata data) external returns (Error err);
    function safeBatchTransferFrom(address from, address to, uint256[] calldata ids, uint256[] calldata values, bytes calldata data) external returns (Error err);
}

