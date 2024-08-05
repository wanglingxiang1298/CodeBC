pragma solidity ^0.8.20;
interface IERC1363Receiver {
    function onTransferReceived(
        address operator,
        address from,
        uint256 amount,
        bytes memory data
    ) external returns (bytes4);
}