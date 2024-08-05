pragma solidity ^0.8.20;
abstract contract ReentrancyGuard {
    uint256 private _status;
    error ReentrancyGuardReentrantCall();
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() internal virtual {
        if (_status!= NOT_ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }
        _status = ENTERED;
    }
    function _nonReentrantAfter() internal virtual {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}