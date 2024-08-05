pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1363/IERC1363Receiver.sol";

contract MyTokenReceiver is IERC1363Receiver {
    function onTransferReceived(address operator, address from, uint256 amount, bytes calldata data) external override returns (bytes4) {
        // Your logic for receiving the transfer of ERC1363 tokens goes here
        // For example, you could transfer the tokens to a specific address or perform some other action
        return IERC1363Receiver.onTransferReceived(operator, from, amount, data);
    }
}