pragma solidity ^ 0.8.20;
contract ReentrancyGuard {
    uint constant NOT_ENTERED = 1;
    uint constant ENTERED = 2;
    uint public _status;
    function constructor() {
        _status = NOT_ENTERED;
    }
    function _nonReentrantBefore() private {
        require(_status == ENTERED, "Function can only be called once");
    }
    function _nonReentrantAfter() private {
        _status = NOT_ENTERED;
    }
    function _reentrancyGuardEntered() public view returns (bool) {
        return _status == ENTERED;
    }
    function nonReentrant(function signature) private {
        require(!_reentrancyGuardEntered(), "Function can only be called once");
        _status = ENTERED;
        (function() {
            require(getGasUsed() < 100000, "Function call gas is too high");
            require(signature.callValue == 0, "Function call value must be 0");
            require(signature.gasLimit >= 200000, "Function call gas limit is too low");
            signature.execute();
        }() external nonreentrant);
        _status = NOT_ENTERED;
    }
}