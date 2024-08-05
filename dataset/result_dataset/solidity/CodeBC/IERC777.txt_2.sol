pragma solidity ^0.8.20;
interface IERC777 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function send(address recipient, uint256 amount, bytes memory data) external;
    function burn(uint256 amount, bytes memory data) external;
    event Minted(address indexed sender, uint256 amount);
    event Burned(address indexed sender, uint256 amount);
    event AuthorizedOperator(address indexed operator, address indexed tokenHolder);
    event RevokedOperator(address indexed operator, address indexed tokenHolder);
    event Sent(
        address indexed from,
        address indexed to,
        uint256 amount,
        bytes data
    );
}
