pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol";

contract MyERC721Receiver is IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external override returns (bytes4) {
        // Your logic for receiving the transfer of ERC721 tokens goes here
        return IERC721Receiver(this).onERC721Received.selector;
    }
}