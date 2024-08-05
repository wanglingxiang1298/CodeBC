pragma solidity ^0.8.20;
interface IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes memory data) external returns (bytes4);
}