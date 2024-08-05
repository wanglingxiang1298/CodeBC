pragma solidity ^0.8.20;
interface IERC721Receiver {
    bytes4 onERC721Received(address operator, address from, uint256 tokenId, bytes data) external returns (bytes4);
}