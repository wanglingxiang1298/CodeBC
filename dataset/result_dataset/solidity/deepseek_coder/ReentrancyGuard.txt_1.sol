pragma solidity ^0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint private _status;
    function constructor() {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
    modifier nonReentrant() {
        require(!_reentrancyGuardEntered(), "ReentrancyGuard: reentrant call");
        _nonReentrantBefore();
        try {
            yield;
        }
        catch (Exception[] memory e) {
            require(e.length == 1, "ReentrancyGuard: unexpected error");
            require(e[0] is ReentrancyGuardReentrantCall, "ReentrancyGuard: reentrant call");
        }
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() private {
        require(_reentrancyGuardEntered(), "ReentrancyGuard: not entered reentrant state");
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function getStatus() external view returns (uint) {
        return _status;
    }
    function getEntered() external view returns (bool) {
        return _reentrancyGuardEntered();
    }
    function getReentrancyGuardReentrantCall() external pure returns (address) {
        return address(0);
    }
    function Error() private pure {}
    event ReentrancyGuardReentrantCall();
}