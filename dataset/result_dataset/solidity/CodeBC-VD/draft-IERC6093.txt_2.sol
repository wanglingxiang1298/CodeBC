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
    function approve(address token, address to, uint256 amount) external returns (bool);
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
    event TransferFailed(address token, address from, address to, Error err);
    function safeTransferFrom(address token, address from, address to) external payable;
    function safeTransferFrom(address token, address from, address to, bytes memory data) external payable;
    function safeTransferFrom(address token, address from, address to, bytes memory data, uint256 price) external payable;
    function approve(address token, address to) external returns (bool);
    function setApprovalForAll(address operator, bool approved) external returns (bool);
    function getApproved(address token, address owner) external view returns (address);
    function balanceOf(address token, address owner) external view returns (uint256);
    function ownerOf(address token, uint256 tokenId) external view returns (address);
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
    event TransferFailed(address token, address from, address to, uint256 id, uint256 amount, Error err);
    function safeTransferFrom(address token, address from, address to, uint256 id, uint256 value) external payable;
    function safeTransferFrom(address token, address from, address to, uint256 id, uint256 value, bytes memory data) external payable;
    function safeTransferFrom(address token, address from, address to, uint256 id, uint256 value, bytes memory data, uint256 price) external payable;
    function safeBatchTransferFrom(address token, address from, address to, uint256[] memory ids, uint256[] memory values) external payable;
    function safeBatchTransferFrom(address token, address from, address to, uint256[] memory ids, uint256[] memory values, bytes memory data) external payable;
    function safeBatchTransferFrom(address token, address from, address to, uint256[] memory ids, uint256[] memory values, bytes memory data, uint256 price) external payable;
    function setApprovalForAll(address operator, bool approved) external returns (bool);
    function getApproved(address token, uint256 id) external view returns (address);
    function balanceOf(address token, address owner) external view returns (uint256);
    function ownerOf(address token, uint256 id) external view returns (address);
}