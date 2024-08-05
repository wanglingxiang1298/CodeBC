pragma solidity ^0.8.20;
contract AccessManaged {
    address public authority;
    bool public isScheduledOperation;
    event AuthorityUpdated(address indexed authority);
    error AccessManagedUnauthorized() {
        revert("Caller does not have permission to perform this action");
    }
    error AccessManagedRequiredDelay() {
        revert("Caller needs to wait for a certain period of time before performing this action");
    }
    error AccessManagedInvalidAuthority() {
        revert("Supplied authority control address is invalid");
    }
    constructor() {
        authority = msg.sender;
    }
    modifier onlyAuthority() {
        require(msg.sender == authority, "AccessManagedUnauthorized");
        _;
    }
    function authority() public view returns (address) {
        return _authority;
    }
    function setAuthority(address newAuthority) public onlyAuthority {
        require(newAuthority!= address(0), "AccessManagedInvalidAuthority");
        _authority = newAuthority;
        emit AuthorityUpdated(_authority);
    }
    function isConsumingScheduledOp() public view returns (bool) {
        return _isScheduledOperation;
    }
    function _updateScheduledOperationState() internal {
        _isScheduledOperation = true;
        emit ScheduledOperationStarted();
    }
    function _resetScheduledOperationState() internal {
        _isScheduledOperation = false;
        emit ScheduledOperationFinished();
    }
    event ScheduledOperationStarted();
    event ScheduledOperationFinished();
}