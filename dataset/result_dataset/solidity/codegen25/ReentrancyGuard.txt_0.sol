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
    function nonReentrant(function signature) private {
        require(extractFunctionName(function signature) == "ReentrancyGuardReentrantCall", "Function can only be called during nonreentrant state");
        _nonReentrantBefore();
        function() {
            _nonReentrantAfter();
        }
    }
    function extractFunctionName(string memory _functionSignature) private view returns (string) {
        return extractVariableNameFromSignature(_functionSignature, "function ");
    }
    function extractVariableNameFromSignature(string memory _functionSignature, string memory _prefix) private view returns (string) {
        string memory _start = _functionSignature.substr(0, _functionSignature.find(_prefix));
        string memory _end = _start.substr(_start.find(" ") + 1);
        return _end.substr(0, _end.find("("))
    }
}