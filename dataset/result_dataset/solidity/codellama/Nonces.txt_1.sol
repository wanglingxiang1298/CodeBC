pragma solidity ^0.8.20;

abstract contract Nonces {
    mapping(address => uint256) public nonces;

    function nonces(address account) public view returns (uint256) {
        return nonces[account];
    }

    function _useNonce(address account, uint256 nonce) public {
        nonces[account] = nonce;
    }

    function _useCheckedNonce(address account, uint256 nonce) public {
        if (nonces[account]!= nonce) {
            revert InvalidAccountNonce(account, nonce);
        }
        nonces[account] = nonce;
    }
}