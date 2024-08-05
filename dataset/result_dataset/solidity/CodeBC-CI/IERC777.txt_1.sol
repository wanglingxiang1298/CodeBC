pragma solidity ^0.8.20;
interface IERC777 {
    event Minted(address indexed operator, address indexed from, uint256 amount, bytes data);
    event Burned(address indexed operator, address indexed from, uint256 amount, bytes data);
    event AuthorizedOperator(address indexed operator, address indexed addr);
    event RevokedOperator(address indexed operator, address indexed addr);
    event Sent(address indexed operator, address indexed from, address indexed to, uint256 amount, bytes data);
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function granularity() external view returns (uint256);
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function send(address to, uint256 amount, bytes memory data) external;
    function burn(uint256 amount, bytes memory data) external;
    function isOperatorFor(address addr) external view returns (bool);
    function authorizeOperator(address addr) external;
    function revokeOperator(address addr) external;
    function defaultOperators() external view returns (address[] memory);
    function operatorSend(address addr, uint256 amount, bytes memory data, enum IERC777.operatorSendOperatorFee operatorFee, address feeRecipient) external;
    function operatorBurn(uint256 amount, bytes memory data) external;
}