pragma solidity ^0.8.20;
contract ERC721Receiver {
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4) {
        require(operator == msg.sender, "ERC721: caller is not the sender");
        emit ReceivedERC721(operator, from, tokenId, data);
        return bytes4(keccak256("onERC721Received(address,address,uint256,bytes)"));
    }
    event ReceivedERC721(address indexed operator, address indexed from, uint256 indexed tokenId, bytes data);
}