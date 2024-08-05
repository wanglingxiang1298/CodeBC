pragma solidity ^0.8.20;
contract AccessManaged is IAccessManaged {
    address public authority;
    bool public isScheduledOperation;
    constructor() {
        authority = msg.sender;
        isScheduledOperation = false;
    }
    modifier onlyAuthority() {
        require(msg.sender == authority, "AccessManagedUnauthorized");
        _;
    }
    modifier whenScheduledOperation() {
        require(isConsumingScheduledOp(), "AccessManagedUnauthorized");
        _;
    }
    event AuthorityUpdated(address newAuthority);
    function getAuthority() external view override returns (address) {
        return authority;
    }
    function setAuthority(address newAuthority) external onlyAuthority {
        require(newAuthority!= address(0), "AccessManagedInvalidAuthority");
        authority = newAuthority;
        emit AuthorityUpdated(newAuthority);
    }
    function isConsumingScheduledOp() public view override returns (bool) {
        return isScheduledOperation;
    }
    function scheduleOperation() public {
        isScheduledOperation = true;
    }
    function cancelScheduledOperation() public {
        isScheduledOperation = false;
    }
}
