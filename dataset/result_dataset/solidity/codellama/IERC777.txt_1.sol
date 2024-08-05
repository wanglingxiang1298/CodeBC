pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC777/IERC777.sol";

contract MyToken is IERC777 {
    string public name;
    string public symbol;
    uint256 public granularity;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    event Minted(address indexed from, uint256 indexed amount);
    event Burned(address indexed from, uint256 indexed amount);
    event AuthorizedOperator(address indexed operator, address indexed tokenHolder);
    event RevokedOperator(address indexed operator, address indexed tokenHolder);
    event Sent(address indexed from, address indexed to, uint256 indexed amount);

    constructor(string memory _name, string memory _symbol, uint256 _granularity) public {
        name = _name;
        symbol = _symbol;
        granularity = _granularity;
    }

    function name() public view returns (string memory) {
        return name;
    }

    function symbol() public view returns (string memory) {
        return symbol;
    }

    function granularity() public view returns (uint256) {
        return granularity;
    }

    function totalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return balanceOf[account];
    }

    function send(address to, uint256 amount) public {
        require(amount > 0, "Invalid amount");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        require(to!= address(0), "Invalid recipient");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        emit Sent(msg.sender, to, amount);
    }

    function burn(uint256 amount) public {
        require(amount > 0, "Invalid amount");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Burned(msg.sender, amount);
    }

    function isOperatorFor(address operator, address tokenHolder) public view returns (bool) {
        return operator == tokenHolder;
    }

    function authorizeOperator(address operator) public {
        require(operator!= address(0), "Invalid operator");
        require(balanceOf[msg.sender] >= granularity, "Insufficient balance");

        emit AuthorizedOperator(operator, msg.sender);
    }

    function revokeOperator(address operator) public {
        require(operator!= address(0), "Invalid operator");
        require(balanceOf[msg.sender] >= granularity, "Insufficient balance");

        emit RevokedOperator(operator, msg.sender);
    }

    function defaultOperators() public view returns (address[] memory) {
        return new address[](0);
    }

    function operatorSend(address to, uint256 amount) public {
        require(amount > 0, "Invalid amount");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        require(to!= address(0), "Invalid recipient");

        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;

        emit Sent(msg.sender, to, amount);
    }

    function operatorBurn(uint256 amount) public {
        require(amount > 0, "Invalid amount");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");

        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;

        emit Burned(msg.sender, amount);
    }
}