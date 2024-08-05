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
    event TransferFailed(address token, address from, address to, uint256 amount, Error err);
    function transfer(address token, address to, uint256 amount) external returns (bool);
    function transferFrom(address token, address from, address to, uint256 amount) external returns (bool);
    function approve(address token, address approver, uint256 amount) external returns (bool);
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
    event TransferFailed(address token, address from, address to, uint256 tokenId, Error err);
    function safeTransferFrom(address token, address from, address to, uint256 tokenId) external;
    function safeTransferFrom(address token, address from, address to, uint256 tokenId, bytes calldata data) external;
    function transferFrom(address token, address from, address to, uint256 tokenId) external returns (bool);
    function approve(address token, address approver, uint256 tokenId) external returns (bool);
    function setApprovalForAll(address operator, bool approved) external;
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
    event TransferFailed(address token, address from, address to, uint256 id, uint256 value, Error err);
    function safeTransferFrom(address token, address from, address to, uint256 id, uint256 value, bytes calldata data) external;
    function safeTransferFrom(address token, address from, address to, uint256 id, uint256 value) external;
    function transferFrom(address token, address from, address to, uint256 id, uint256 value) external returns (bool);
    function batchTransferFrom(address token, address from, address to, uint256[] calldata ids, uint256[] calldata values) external returns (bool);
    function approve(address token, address approver, uint256 id) external returns (bool);
    function setApprovalForAll(address operator, bool approved) external;
}