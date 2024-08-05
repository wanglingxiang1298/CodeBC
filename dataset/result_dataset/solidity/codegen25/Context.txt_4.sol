pragma solidity ^0.8.20;
contract Context {
    function _msgSender() external onlyView returns (address) {
        return address(uint160(uint(block.timestamp).uint8(msg.sender.codeId)))
    }
    function _msgData() external onlyView returns (bytes) {
        return msg.data
    }
}