pragma solidity ^0.8.20;
library SignedMath {
    function max(int256 a, int256 b) internal pure returns (int256) {
        if (a > b) {
            return a;
        } else {
            return b;
        }
    }
    function min(int256 a, int256 b) internal pure returns (int256) {
        if (a > b) {
            return b;
        } else {
            return a;
        }
    }
    function average(int256 a, int256 b) internal pure returns (int256) {
        return (a + b) / 2;
    }
    function abs(int256 a) internal pure returns (int256) {
        if (a < 0) {
            return -a;
        } else {
            return a;
        }
    }
}