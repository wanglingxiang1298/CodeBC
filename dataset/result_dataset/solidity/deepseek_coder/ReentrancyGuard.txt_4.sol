pragma solidity ^0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint public _status;
    function constructor() {
        _status = NOT_ENTERED;
    }
    function _nonReentrantBefore() private {
        require(_status == ENTERED, "Function can only be called during reentrant state");
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() public view returns (bool) {
        return _status == ENTERED;
    }
    function nonReentrant(function_t toCall()) private returns (bool) {
        require(!_reentrancyGuardEntered(), "Function can only be called once");
        _status = ENTERED;
        toCall();
        _status = NOT_ENTERED;
        return true;
    }
}