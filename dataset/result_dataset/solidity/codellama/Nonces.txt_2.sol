pragma solidity ^0.8.20;

abstract contract Nonces {
    mapping(address => uint256) private nonces;

    function nonces(address account) public view returns (uint256) {
        return nonces[account];
    }

    function _useNonce(address account) public returns (uint256) {
        uint256 nonce = nonces[account];
        nonces[account] = nonce + 1;
        return nonce;
    }

    function _useCheckedNonce(address account, uint256 nonce) public {
        require(nonce == nonces[account], "InvalidAccountNonce");
        nonces[account] = nonce + 1;
    }
}