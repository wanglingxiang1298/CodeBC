pragma solidity ^0.8.20;
abstract contract Nonces {
    error InvalidAccountNonce(address account, uint256 currentNonce);
    mapping(address account => uint256) private _nonces;
    function nonces(address owner) public view virtual returns (uint256) {
        return _nonces[owner];
    }
    function _useNonce(address owner) internal virtual returns (uint256) {
        unchecked {
            return _nonces[owner]++;
        }
    }
    function _useCheckedNonce(address owner, uint256 nonce) internal virtual {
        uint256 current = _useNonce(owner);
        if (nonce != current) {
            revert InvalidAccountNonce(owner, current);
        }
    }
}