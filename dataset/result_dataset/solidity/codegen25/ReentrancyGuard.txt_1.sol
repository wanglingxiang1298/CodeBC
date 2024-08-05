pragma solidity ^0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint public _status;
    uint public constant NOT_ENTERED = NOT_ENTERED;
    uint public constant ENTERED = ENTERED;
    modifier nonReentrant() {
        require(_status == NOT_ENTERED, "Function can only be called once");
        _status = ENTERED;
        _nonReentrantBefore();
        yield;
        _nonReentrantAfter();
        _status = NOT_ENTERED;
        _reentrancyGuardEntered();
    }
    function _nonReentrantBefore() public {
        require(_status == ENTERED, "Function can only be called once");
    }
    function _nonReentrantAfter() public {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() public view {
        return _status == ENTERED;
    }
}