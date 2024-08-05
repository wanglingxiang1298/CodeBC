pragma solidity ^0.8.20;
enum ErrorTypes {
    InvalidAccountNonce
}
mapping(address => uint256) private nonces;
function Nonces() {
    nonces[msg.sender] = 0;
}
function nonces(address account) public view returns (uint256) {
    return nonces[account];
}
function _useNonce(address account, uint256 newNonce) internal returns (bool) {
    nonces[account] = newNonce;
    return true;
}
function _useCheckedNonce(address account, uint256 newNonce) internal returns (bool) {
    if (newNonce == nonces[account]) {
        nonces[account] += 1;
        return true;
    } else {
        revert("Invalid account nonce");
    }
}