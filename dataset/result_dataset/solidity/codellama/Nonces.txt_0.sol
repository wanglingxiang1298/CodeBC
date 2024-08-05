pragma solidity ^0.8.20;

abstract contract Nonces {
    mapping(address => uint256) private _nonces;

    function nonces(address account) public view returns (uint256) {
        return _nonces[account];
    }

    function _useNonce(address account) public returns (uint256) {
        uint256 nonce = _nonces[account];
        _nonces[account] = nonce + 1;
        return nonce;
    }

    function _useCheckedNonce(address account, uint256 nonce) public {
        require(nonce == _nonces[account], "InvalidAccountNonce");
        _nonces[account] = nonce + 1;
    }
}