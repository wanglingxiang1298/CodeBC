pragma solidity ^0.8.20;
abstract contract Nonces {
    error InvalidAccountNonce();
    mapping(address => uint256) public nonces;
    function _useNonce(address account) internal {
        nonces[account]++;
    }
    function _useCheckedNonce(address account, uint256 nonce) internal {
        if (nonces[account]!= nonce) {
            revert InvalidAccountNonce();
        }
        _useNonce(account);
    }
}