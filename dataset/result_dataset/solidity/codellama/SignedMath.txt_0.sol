pragma solidity ^0.8.20;

library SignedMath {
    function max(int256 a, int256 b) public pure returns (int256) {
        return a > b? a : b;
    }

    function min(int256 a, int256 b) public pure returns (int256) {
        return a < b? a : b;
    }

    function average(int256 a, int256 b) public pure returns (int256) {
        return (a + b) / 2;
    }

    function abs(int256 a) public pure returns (int256) {
        return a < 0? -a : a;
    }
}