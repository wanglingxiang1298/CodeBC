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
        require(ERC1363(msg.sender).transferFrom(address(this), address(0), 0));
        emit ReceivedERC1363(from, amount, data);
    }
}
