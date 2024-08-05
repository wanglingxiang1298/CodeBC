pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC777/IERC777Sender.sol";

contract MyToken is IERC777Sender {
    //...

    function tokensToSend(address operator, address from, address to, uint256 amount, bytes userData, bytes operatorData) public override {
        // Perform some specific logic to handle the token transfer to be sent
        //...
    }
}