pragma solidity ^0.8.20;
contract Nonces {
    mapping(address => uint256) private nonces;
    function nonces(address account) external view returns (uint256) {
        return nonces[account];
    }
    function _useNonce(address account, uint256 newNonce) internal returns (bool) {
        if (newNonce > nonces[account]) {
            nonces[account] = newNonce;
            return true;
        } else {
            revert("Invalid account nonce.");
        }
    }
    function _useCheckedNonce(address account, uint256 newNonce) internal returns (bool) {
        if (newNonce > nonces[account]) {
            nonces[account] = newNonce;
            return true;
        } else {
            revert("Invalid account nonce.");
        }
    }
}