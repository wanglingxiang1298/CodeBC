pragma solidity ^ 0.8.20;
contract Context {
    function _msgSender() external pure returns (address) {
        return address(uint160(getcallcodehash(msg.value, msg.data)));
    }
    function _msgData() external pure returns (bytes) {
        return msg.data;
    }
}