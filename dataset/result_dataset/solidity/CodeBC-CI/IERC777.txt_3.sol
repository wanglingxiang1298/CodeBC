pragma solidity ^0.8.20;
interface IERC777 {
    event Minted(uint256 amount, address indexed operator);
    event Burned(uint256 amount, address indexed operator);
    event AuthorizedOperator(address indexed operator);
    event RevokedOperator(address indexed operator);
    event Sent(uint256 amount, address indexed operator, address indexed to);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function send(address to, uint256 amount) external;
    function burn(uint256 amount) external;
    function isOperatorFor(address address_) external view returns (bool);
    function authorizeOperator(address address_) external;
    function revokeOperator(address address_) external;
    function defaultOperators() external view returns (address[] memory);
    function operatorSend(address to, uint256 amount, bytes memory data) external;
    function operatorBurn(uint256 amount, bytes memory data) external;
}