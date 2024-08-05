pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1363/IERC1363Receiver.sol";

contract MyTokenReceiver is IERC1363Receiver {
    // Implement the onTransferReceived function
    function onTransferReceived(address operator, address from, uint256 amount, bytes data) public override returns (bytes4) {
        // Check if the contract complies with the ERC1363 interface specification
        require(operator == address(this), "Only the contract itself can receive tokens");
        require(from == address(this), "Only the contract itself can receive tokens");
        require(amount > 0, "Invalid amount");
        require(data.length == 0, "Invalid data");

        // Perform any additional actions required by the contract
        //...

        // Return the bytes4 value indicating whether the contract complies with the ERC1363 interface specification
        return bytes4(keccak256("onTransferReceived(address,address,uint256,bytes)"));
    }
}