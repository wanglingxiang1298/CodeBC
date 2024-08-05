pragma solidity ^0.8.20;
contract AccessManaged is IAccessManaged {
    address public authority;
    bool public scheduledOperation;
    constructor() {
        authority = msg.sender;
        scheduledOperation = false;
    }
    modifier onlyAuthority() {
        require(msg.sender == authority, "AccessManagedUnauthorized");
        _;
    }
    modifier notScheduled() {
        require(scheduledOperation == false, "AccessManagedRequiredDelay");
        _;
    }
    function authority() external view override returns (address) {
        return authority;
    }
    function setAuthority(address newAuthority) external onlyAuthority {
        require(newAuthority!= address(0), "AccessManagedInvalidAuthority");
        authority = newAuthority;
        emit AuthorityUpdated(authority);
    }
    function isConsumingScheduledOp() external view override returns (bool) {
        return scheduledOperation;
    }
    function scheduledOperationStart() external onlyAuthority notScheduled {
        scheduledOperation = true;
    }
    function scheduledOperationEnd() external onlyAuthority {
        require(scheduledOperation == true, "AccessManagedRequiredDelay");
        scheduledOperation = false;
    }
    event AuthorityUpdated(address indexed newAuthority);
}