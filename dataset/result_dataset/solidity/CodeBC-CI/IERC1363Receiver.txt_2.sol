pragma solidity ^0.8.20;
interface IERC1363Receiver {
    function onTransferReceived(address operator, address from, uint256 amount, bytes calldata data) external returns (bytes4);
}
contract ERC1363Receiver is IERC1363Receiver {
    event Received(address from, uint256 amount, bytes data);
    function onTransferReceived(address operator, address from, uint256 amount, bytes calldata data) external override returns (bytes4) {
        emit Received(from, amount, data);
        return bytes4(keccak256('onERC1363Received(address,address,uint256,bytes)'));
    }
 <SUF>(address operator, address from, uint256 amount, bytes calldata data) external override returns (bytes4) {
        emit Received(from, amount, data);
        return bytes4(keccak256('onERC1363Received(address,address,uint256,bytes)'));
    }
}