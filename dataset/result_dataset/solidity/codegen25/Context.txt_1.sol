pragma solidity ^0.8.20;
contract Context {
    function _msgSender() public view returns (address) {
        return address(msg.sender);
    }
    function _msgData() public view returns (bytes) {
        return msg.data;
    }
}