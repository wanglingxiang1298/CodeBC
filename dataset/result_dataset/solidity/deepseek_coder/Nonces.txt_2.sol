pragma solidity ^0.8.20;
enum InvalidAccountNonce : 32 {
    InvalidAccountNonce_Base = 1;
    InvalidAccountNonce_NonceOutOfBounds,
    InvalidAccountNonce_WrongNonce
}
mapping(address => uint256) private nonces;
function Nonces() {
    nonces[msg.sender] = 0;
}
function nonces(address account) public view returns (uint256) {
    return nonces[account];
}
function _useNonce(address account, uint256 nonce) private returns (bool) {
    if (nonce == nonces[account]) {
        nonces[account]++;
        return true;
    } else {
        emit InvalidAccountNonce("Nonce is invalid.");
        return false;
    }
}
function _useCheckedNonce(address account, uint256 nonce) private returns (bool) {
    if (nonce == nonces[account]) {
        nonces[account]++;
        return true;
    } else {
        emit InvalidAccountNonce("Nonce is invalid.");
        return false;
    }
}