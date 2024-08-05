pragma solidity ^0.8.20;
contract Nonces {
    mapping(address => uint256) nonces;
    error InvalidAccountNonce(uint256 expectedNonce, uint256 actualNonce);
    function _useNonce(address account) internal returns (uint256) {
        uint256 nonce = nonces[account];
        nonces[account] = nonce + 1;
        return nonce;
    }
    function _useCheckedNonce(address account, uint256 nonce) internal returns (uint256) {
        uint256 currentNonce = _useNonce(account);
        if (nonce!= currentNonce) {
            revert InvalidAccountNonce(currentNonce, nonce);
        }
        return currentNonce;
    }
}