pragma solidity ^0.8.20;
contract Nonces {
    struct AccountNonce {
        address owner;
        uint nonce;
    }
    mapping (address => AccountNonce) _accountNonces;
    function nonces(address account) public view returns (uint) {
        AccountNonce accountNonce = _accountNonces[account];
        return accountNonce.nonce;
    }
    function _useNonce(address account, uint newNonce) internal returns (uint) {
        AccountNonce accountNonce = _accountNonces[account];
        if (accountNonce.nonce != newNonce) {
            revert("Invalid account nonce.");
        }
        accountNonce.nonce = newNonce + 1;
        return newNonce;
    }
    function _useCheckedNonce(address account, uint newNonce) internal returns (uint) {
        AccountNonce accountNonce = _accountNonces[account];
        if (accountNonce.nonce != newNonce) {
            revert("Invalid account nonce.");
        }
        return newNonce;
    }
}