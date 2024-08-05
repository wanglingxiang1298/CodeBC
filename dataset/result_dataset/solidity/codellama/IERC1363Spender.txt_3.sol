pragma solidity ^0.8.20;

interface IERC1363Spender {
    function onApprovalReceived(address owner, uint256 amount, bytes calldata data) external returns (bytes4);
}

contract MyContract is IERC1363Spender {
    //...

    function onApprovalReceived(address owner, uint256 amount, bytes calldata data) external override returns (bytes4) {
        //...
        return bytes4(keccak256("onApprovalReceived(address,uint256,bytes)"));
    }
}