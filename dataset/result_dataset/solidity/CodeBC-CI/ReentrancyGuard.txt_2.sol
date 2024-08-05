pragma solidity ^0.8.20;
contract ReentrancyGuard {
    uint256 private constant NOT_ENTERED = 1;
    uint256 private constant ENTERED = 2;
    uint256 private _status;
    error ReentrancyGuardReentrantCall();
    constructor() {
        _status = NOT_ENTERED;
    }
    function nonReentrant() internal {
        _nonReentrantBefore();
        _function();
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() internal {
        require(_status!= ENTERED, ReentrancyGuardReentrantCall());
        _status = ENTERED;
    }
    function _nonReentrantAfter() internal {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}