pragma solidity ^0.8.20;
interface IERC1820Implementer {
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) external view returns (bool);
}
contract ERC1820Implementer is IERC1820Implementer {
    function canImplementInterfaceForAddress(bytes32 interfaceHash, address account) external override view returns (bool) {
        bytes32 erc165Hash = keccak256("ERC165().supportsInterface(bytes4)");
        bytes32 erc721Hash = keccak256("ERC721().supportsInterface(bytes4)");
        bytes32 erc721MetadataHash = keccak256("ERC721Metadata().supportsInterface(bytes4)");
        bytes32 erc721EnumerableHash = keccak256("ERC721Enumerable().supportsInterface(bytes4)");
        bytes32 erc1155Hash = keccak256("ERC1155().supportsInterface(bytes4)");
        bytes32 erc1155MetadataHash = keccak256("ERC1155Metadata().supportsInterface(bytes4)");
        bytes32 erc1155EnumerableHash = keccak256("ERC1155Enumerable().supportsInterface(bytes4)");
        if (interfaceHash == erc165Hash || interfaceHash == erc721Hash || interfaceHash == erc721MetadataHash || interfaceHash == erc721EnumerableHash || interfaceHash == erc1155Hash || interfaceHash == erc1155MetadataHash || interfaceHash == erc1155EnumerableHash) {
            return account.supportsInterface(interfaceHash);
        } else {
            return false;
        }
    }
}
