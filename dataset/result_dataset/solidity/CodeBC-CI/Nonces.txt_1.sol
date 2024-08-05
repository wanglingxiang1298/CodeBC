pragma solidity ^0.8.20;
abstract contract Nonces {
    error InvalidAccountNonce();
    mapping(address => uint256) private _nonces;
    function nonces(address account) external view returns (uint256) {
        return _nonces[account];
    }
    function _useNonce(address account) internal {
        _nonces[account]++;
    }
    function _useCheckedNonce(address account, uint256 nonce) internal {
        if (_nonces[account]!= nonce) {
            revert InvalidAccountNonce();
        }
        _nonces[account]++;
    }
}