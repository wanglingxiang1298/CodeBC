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
        require(!_reentrancyGuardEntered(), "ReentrancyGuard: previous function has not finished");
        _nonReentrantBefore();
        _status = ENTERED;
        yield;
        _status = NOT_ENTERED;
        _nonReentrantAfter();
    }
    function _nonReentrantBefore() private {
        require(_status == ENTERED, "ReentrancyGuard: function can only be called once");
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function getStatus() private view returns (uint) {
        return _status;
    }
    function getEntered() private view returns (bool) {
        return _reentrancyGuardEntered();
    }
    function() external {}
}
contract Example {
    uint constant MAX_VALUE = 100;
    function getRandom() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.timestamp))) % MAX_VALUE;
    }
    function() external {}
}