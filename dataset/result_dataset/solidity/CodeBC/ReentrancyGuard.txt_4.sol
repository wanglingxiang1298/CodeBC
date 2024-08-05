pragma solidity ^0.8.20;
abstract contract ReentrancyGuard {
    uint256 internal constant NOT_ENTERED = 1;
    uint256 internal constant ENTERED = 2;
    uint256 private _status;
    error ReentrancyGuardReentrantCall();
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() internal {
        if (_status!= NOT_ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }
        _status = ENTERED;
    }
    function _nonReentrantAfter() internal {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() internal view returns (bool) {
        return _status == ENTERED;
    }
}
