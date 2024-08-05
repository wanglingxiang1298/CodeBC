pragma solidity ^ 0.8.20;
contract Context {
    function _msgSender() external onlyViewable() returns (address) {
    }
    function _msgData() external onlyViewable() returns (bytes) {
        return calldata();
    }
    private function onlyViewable() internal returns (bool) {
        return false;
    }
}