pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/token/ERC1363/IERC1363Spender.sol";

contract MyContract is IERC1363Spender {
    //...

    function onApprovalReceived(address owner, uint256 amount, bytes memory data) public override returns (bytes4) {
        //...
        return bytes4(keccak256("onApprovalReceived(address,uint256,bytes)"));
    }

    //...
}