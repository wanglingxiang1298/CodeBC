pragma solidity ^ 0.8.20;
contract IAuthority {
    function canCall(address caller, address target, bytes4 selector) internal view returns (bool) {
    }
}