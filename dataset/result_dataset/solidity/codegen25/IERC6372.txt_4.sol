pragma solidity ^0.8.20;
import "./IERC6372.sol";
contract Clock is IERC6372 {
    uint48 public _clockValue;
    string public _clockMode;
    constructor() {
        _clockValue = extractClockValue();
        _clockMode = extractClockMode();
    }
    function extractClockValue() public view returns (uint48) {
        return _clockValue;
    }
    function extractClockMode() public view returns (string) {
        return _clockMode;
    }
    function clock() public view returns (uint48) {
        return _clockValue;
    }
    function CLOCK_MODE() public view returns (string) {
        return _clockMode;
    }
}