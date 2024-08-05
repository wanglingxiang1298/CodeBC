pragma solidity ^0.8.20;
abstract contract Nonces {
    error InvalidAccountNonce();
    mapping(address => uint256) private _nonces;
    function nonces(address account) public view virtual returns (uint256) {
        return _nonces[account];
    }
    function _useNonce(address account) internal virtual {
        _nonces[account]++;
    }
    function _useCheckedNonce(address account, uint256 nonce) internal virtual {
        if (nonce!= _nonces[account]) {
            revert InvalidAccountNonce();
        }
        _nonces[account]++;
    }
}
