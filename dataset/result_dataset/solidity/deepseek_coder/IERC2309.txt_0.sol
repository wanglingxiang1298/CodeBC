pragma solidity ^ 0.8.20;
contract IERC2309 {
    event ConsecutiveTransfer(address indexed fromAddress, address indexed toAddress, uint256 amount);
    function transfer(uint256 amount) public {
        emit ConsecutiveTransfer(msg.sender, msg.to, amount);
    }
}