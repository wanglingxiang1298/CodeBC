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
        if (a < b) {
            return a;
        } else {
            return b;
        }
    }
    function average(int256 a, int256 b) internal pure returns (int256) {
        int256 c = a + b;
        int256 divisor = c > 0 ? 2 : 1;
        return c / divisor;
    }
    function abs(int256 a) internal pure returns (int256) {
        if (a < 0) {
            a = -a;
        }
        return a;
    }
}