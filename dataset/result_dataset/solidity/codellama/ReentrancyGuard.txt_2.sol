pragma solidity ^0.8.20;

contract ReentrancyGuard {
    // Constants
    uint256 public constant NOT_ENTERED = 1;
    uint256 public constant ENTERED = 2;

    // Variables
    uint256 private _status;

    // Error types
    error ReentrancyGuardReentrantCall() {
        return ReentrancyGuardReentrantCall();
    }

    // Constructor
    constructor() {
        _status = NOT_ENTERED;
    }

    // Modifiers
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    // Functions
    function _nonReentrantBefore() private {
        if (_status == ENTERED) {
            revert ReentrancyGuardReentrantCall();
        }
    }

    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }

    function _reentrancyGuardEntered() public view returns (bool) {
        return _status == ENTERED;
    }
}