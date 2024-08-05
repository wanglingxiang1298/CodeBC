pragma solidity ^0.8.20;

abstract contract Context {
    function _msgSender() public view returns (address) {
        return msg.sender;
    }

    function _msgData() public view returns (bytes memory) {
        return msg.data;
    }
}
