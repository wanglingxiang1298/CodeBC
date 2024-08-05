pragma solidity ^0.8.20;
contract Context {
    function _msgSender() external onlyViewable() returns (address) {
        return address(uint160(getcaller()));
    }
    function _msgData() external onlyViewable() returns (bytes) {
        return bytes(calldatasize()) bytes32(calldata() as bytes32);
    }
    private function getcaller() internal pure returns (uint256) {
        return address(uint160(getcallerraw())).codehash();
    }
    private function getcallerraw() internal pure returns (bytes32) {
        return extract32(msg.data, 4, type(bytes32));
    }
}