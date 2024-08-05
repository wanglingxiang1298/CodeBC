pragma solidity ^ 0.8.20;
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
    function nonReentrant(function () internal virtual pure returns (bytes memory) {
        _nonReentrantBefore();
        bytes memory retVal = function();
        _nonReentrantAfter();
        return retVal;
    }
}
contract ExampleContract {
    address public reentrancyGuard;
    function ExampleContract(address _reentrancyGuard) {
        reentrancyGuard = _reentrancyGuard;
    }
    function nonReentrantFunction() public view {
        (bytes memory _) = ReentrancyGuard(reentrancyGuard).nonReentrant();
    }
}