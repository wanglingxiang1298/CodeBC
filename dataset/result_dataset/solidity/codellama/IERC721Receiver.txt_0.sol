pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol";

contract MyERC721Receiver is IERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external override returns (bytes4) {
        // Implement the logic for receiving the transfer of ERC721 tokens here
        // For example, you can check if the token is owned by the contract and then transfer it to the operator
        require(msg.sender == from, "Only the owner can transfer the token");
        _transfer(from, operator, tokenId);
        return IERC721Receiver(operator).onERC721Received.selector;
    }
}