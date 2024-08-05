pragma solidity ^0.8.20;
interface IERC6372 {
    uint48 getClock();
    string getClockMode();
}