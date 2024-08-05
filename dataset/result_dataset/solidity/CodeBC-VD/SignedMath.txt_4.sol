pragma solidity ^0.8.20;
library SignedMath {
    function max(int256 a, int256 b) internal pure returns (int256) {
        return a < b? b : a;
    }
    function min(int256 a, int256 b) internal pure returns (int256) {
        return a < b? a : b;
    }
    function average(int256 a, int256 b) internal pure returns (int256) {
        return (a / 2) + (b / 2) + ((a - b) / 2);
    }
    function abs(int256 a) internal pure returns (int256) {
        return a < 0? -a : a;
    }
}
