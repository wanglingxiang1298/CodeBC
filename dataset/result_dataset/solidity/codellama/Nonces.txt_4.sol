pragma solidity ^0.8.20;

abstract contract Nonces {
    mapping(address => uint256) private _nonces;

    function nonces(address account) public view returns (uint256) {
        return _nonces[account];
    }

    function _useNonce(address account, uint256 nonce) public {
        _nonces[account] = nonce;
    }

    function _useCheckedNonce(address account, uint256 nonce) public {
        if (_nonces[account]!= nonce) {
            revert InvalidAccountNonce(account, nonce);
        }
        _nonces[account] = nonce;
    }
}