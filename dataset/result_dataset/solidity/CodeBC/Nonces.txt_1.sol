pragma solidity ^0.8.20;
abstract contract Nonces {
    error InvalidAccountNonce(uint256 currentNonce, uint256 givenNonce);
    mapping(address => uint256) internal _nonces;
    function nonces(address account) internal virtual returns (uint256) {
        return _nonces[account];
    }
    function _useNonce(address account) internal virtual {
        _nonces[account]++;
    }
    function _useCheckedNonce(address account, uint256 givenNonce) internal virtual {
        if (nonces(account)!= givenNonce) {
            revert InvalidAccountNonce(nonces(account), givenNonce);
        }
        _nonces[account]++;
    }
}
