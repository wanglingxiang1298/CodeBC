pragma solidity ^0.8.20;
contract Context {
    function _msgSender() external onlyView returns (address) {
    }
    function _msgData() external onlyView returns (bytes) {
        return Calldata.getBytes(calldata.size(), calldata.offset());
    }
}