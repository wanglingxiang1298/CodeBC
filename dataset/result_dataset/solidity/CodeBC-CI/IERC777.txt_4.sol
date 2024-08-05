pragma solidity ^0.8.20;
interface IERC777 {
    event Minted(uint256 amount);
    event Burned(uint256 amount);
    event AuthorizedOperator(address indexed operator);
    event RevokedOperator(address indexed operator);
    event Sent(address indexed operator, uint256 amount);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function send(address to, uint256 amount) external;
    function burn(uint256 amount) external;
    function isOperatorFor(address operator) external view returns (bool);
    function authorizeOperator(address operator) external;
    function revokeOperator(address operator) external;
    function defaultOperators() external view returns (address[] memory);
    function operatorSend(address to, uint256 amount) external;
    function operatorBurn(uint256 amount) external;
}