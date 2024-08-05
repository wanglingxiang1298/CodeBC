pragma solidity ^ 0.8.20;
contract Context {
    function _msgSender() external onlyViewable() returns (address) {
        return address(msg.sender);
    }
    function _msgData() external onlyViewable() returns (bytes) {
        return msg.data;
    }
    private function onlyViewable() internal pure returns (bool) {
        return false;
    }
}