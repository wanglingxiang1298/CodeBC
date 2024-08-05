pragma solidity ^0.8.20;
contract Context {
    function _msgSender() internal view returns (address) {
        return address(msg.sender);
    }
    function _msgData() internal view returns (bytes) {
        return msg.data;
    }
}