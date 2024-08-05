pragma solidity ^0.8.20;

import "SignedMath.sol";

contract MyContract {
    using SignedMath for int;

    function max(int a, int b) public pure returns (int) {
        return a.max(b);
    }

    function min(int a, int b) public pure returns (int) {
        return a.min(b);
    }

    function average(int a, int b) public pure returns (int) {
        return (a + b) / 2;
    }

    function abs(int a) public pure returns (int) {
        return a.abs();
    }
}