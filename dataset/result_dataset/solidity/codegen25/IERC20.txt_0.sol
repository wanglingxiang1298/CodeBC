pragma solidity ^0.8.20;
contract IERC20 {
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address owner, address spender, uint256 value);
    public function totalSupply() public view returns (uint256) {
    }
    public function balanceOf(address account) public view returns (uint256) {
    }
    public function transfer(address to, uint256 amount) public returns (bool) {
    }
    public function allowance(address owner, address spender) public view returns (uint256) {
    }
    public function approve(address spender, uint256 amount) public returns (bool) {
    }
    public function transferFrom(address from, address to, uint256 amount) public returns (bool) {
    }
}