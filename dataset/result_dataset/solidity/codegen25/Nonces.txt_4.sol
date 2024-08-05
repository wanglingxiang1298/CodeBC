pragma solidity ^0.8.20;
contract Nonces {
    mapping (address => uint256) private nonces;
    function nonces(address account) external view returns (uint256) {
        return nonces[account];
    }
    function _useNonce(address account) internal returns (uint256) {
        nonces[account]++;
        return nonces[account];
    }
    function _useCheckedNonce(address account, uint256 expectedNonce) internal returns (uint256) {
        nonces[account]++;
        uint256 newNonce = nonces[account];
        require(newNonce == expectedNonce, "Invalid account nonce");
        return newNonce;
    }
}