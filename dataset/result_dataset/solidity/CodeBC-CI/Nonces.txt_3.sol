pragma solidity ^0.8.20;
contract Nonces {
    mapping(address => uint256) nonces;
    error InvalidAccountNonce(address account);
    function nonces(address account) external view returns (uint256) {
        return nonces[account];
    }
    function _useNonce(address account) external returns (uint256) {
        uint256 newNonce = nonces[account] + 1;
        nonces[account] = newNonce;
        return newNonce;
    }
    function _useCheckedNonce(address account, uint256 nonce) external returns (bool) {
        uint256 currentNonce = nonces[account];
        if (nonce!= currentNonce) {
            revert InvalidAccountNonce(account);
        }
        return true;
    }
}