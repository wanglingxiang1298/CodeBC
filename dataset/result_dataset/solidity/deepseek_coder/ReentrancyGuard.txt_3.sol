pragma solidity ^ 0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint public _status;
    uint public constant NOT_ENTERED = 1;
    uint public constant ENTERED = 2;
    modifier nonReentrant() {
        require(_status == NOT_ENTERED, "Function can only be called once");
        _status = ENTERED;
        _reentrancyGuardEntered();
        _nonReentrantBefore();
        yield;
        _nonReentrantAfter();
        _status = NOT_ENTERED;
        _reentrancyGuardEntered();
    }
    function _reentrancyGuardEntered() private view {
        if (address(_status) == msg.sender) {
            _status = ENTERED;
        }
    }
    function _nonReentrantBefore() private {
        require(_status == ENTERED, "Function can only be called once");
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function callSomeFunction() public nonReentrant {
    }
    event ReentrancyGuardReentrantCall();
}