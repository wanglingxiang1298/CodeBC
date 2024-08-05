pragma solidity ^0.8.20;
contract IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address owner, address spender, uint256 value);
    mapping(address => uint256) public balances;
    mapping(address => mapping(address => uint256)) public allowed;
    function balanceOf(address account) external view returns (uint256) {
        return balances[account];
    }
    function transfer(address to, uint256 amount) external {
        require(amount > 0, "Transfer amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
        emit Transfer(msg.sender, to, amount);
    }
    function allowance(address owner, address spender) external view returns (uint256) {
        return allowed[owner][spender];
    }
    function approve(address spender, uint256 amount) external {
        require(amount > 0, "Transfer amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");
        allowed[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
    }
    function transferFrom(address from, address to, uint256 amount) external {
        require(amount > 0, "Transfer amount must be greater than zero");
        require(balances[from] >= amount, "Insufficient balance");
        require(allowed[from][msg.sender] >= amount, "Insufficient approval");
        balances[from] -= amount;
        balances[to] += amount;
        allowed[from][msg.sender] -= amount;
        emit Transfer(from, to, amount);
    }
}