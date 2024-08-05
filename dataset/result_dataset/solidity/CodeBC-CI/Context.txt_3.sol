pragma solidity ^0.8.20;
abstract contract Context {
    fallback() external {
        revert();
    }
    receive() external payable {
        revert();
    }
    function _msgSender() internal view returns (address sender) {
        if (msg.sender == address(this)) {
            sender = msg.sender;
        } else {
            sender = msg.sender;
        }
    }
    function _msgData() internal view returns (bytes calldata) {
        if (msg.data.length > 0) {
            return msg.data;
        } else {
            return "";
        }
    }
}