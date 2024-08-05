pragma solidity ^0.8.20;
interface IERC1363Receiver {
    function onTransferReceived(address operator, address from, uint256 amount, bytes calldata data) external returns (bytes4);
}
contract ERC1363Receiver is IERC1363Receiver {
    using SafeMath for uint256;
    event ReceivedERC1363(address indexed from, uint256 amount, bytes data);
    function onTransferReceived(address operator, address from, uint256 amount, bytes calldata data) external override returns (bytes4) {
        require(operator == msg.sender || operator == address(0), "ERC1363Receiver: operator not allowed");
        require(amount > 0, "ERC1363Receiver: amount is zero");
        require(ERC1363(msg.sender).transferFrom(operator, address(this), 0));
        emit ReceivedERC1363(from, amnt256) {
        return ERC1363(token).transferFrom(owner, address(0), amount);
    }
    function balanceOf(address token, address user) external view returns (uint256) {
        return ERC1363(token).balanceOf(user);
    }
    function allowance(address token, address user, address spender) external view returns (uint256) {
        return ERC1363(token).allowance(user, spender);
    }
}

