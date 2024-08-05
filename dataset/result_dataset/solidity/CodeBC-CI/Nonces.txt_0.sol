pragma solidity ^0.8.20;
contract Nonces {
    mapping(address => uint256) nonces;
    function nonce(address account) external view returns (uint256) {
        return nonces[account];
    }
    function _useNonce(address account) internal {
        nonces[account]++;
    }
    function _useCheckedNonce(address account, uint256 nonce) internal {
        require(nonces[account] == nonce, "InvalidAccountNonce");
        nonces[account]++;
    }
}
