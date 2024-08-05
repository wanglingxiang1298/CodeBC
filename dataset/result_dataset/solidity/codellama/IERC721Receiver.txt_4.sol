pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC721/IERC721Receiver.sol";

contract MyERC721Receiver is IERC721Receiver {
    // Implement the onERC721Received function
    function onERC721Received(address operator, address from, uint256 tokenId, bytes memory data) public override returns (bytes4) {
        // Check if the contract receiving the tokens conforms to the ERC721 interface specification
        if (IERC721Receiver(address(this)).onERC721Received.selector == IERC721Receiver(address(this)).onERC721Received.selector) {
            // Return a value of type bytes4 indicating that the contract receiving the tokens conforms to the ERC721 interface specification
            return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
        } else {
            // Return a value of type bytes4 indicating that the contract receiving the tokens does not conform to the ERC721 interface specification
            return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
        }
    }
}