pragma solidity ^0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint private _status;
    modifier private _nonReentrantBefore() {
        require(_status == NOT_ENTERED, "Function can only be called once");
        _status = ENTERED;
        _reentrancyGuardEntered();
        _nonReentrantAfter();
        _status = NOT_ENTERED;
        _reentrancyGuardEntered();
        yield;
    }
    modifier private _nonReentrantAfter() {
        _reentrancyGuardEntered();
        yield;
        _status = NOT_ENTERED;
        _reentrancyGuardEntered();
    }
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
    function ReentrancyGuardReentrantCall() private pure returns (bool) {
        return false;
    }
    function constructor() private {
        _status = NOT_ENTERED;
        _reentrancyGuardEntered();
    }
    function getEntered() private view returns (bool) {
        return _status == ENTERED;
    }
    function getStatus() private view returns (uint) {
        return _status;
    }
}