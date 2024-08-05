pragma solidity ^0.8.20;
abstract contract ReentrancyGuard {
    uint256 private _status;
    error ReentrancyGuardReentrantCall();
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() private {
        if (_status!= NOT_ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }
        _status = ENTERED;
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() private view returns (bool) {
        return _status == ENTERED;
    }
}
