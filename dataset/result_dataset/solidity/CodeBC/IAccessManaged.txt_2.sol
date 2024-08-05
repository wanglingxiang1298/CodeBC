pragma solidity ^0.8.20;
abstract contract IAccessManaged {
    error AccessManagedUnauthorized();
    error AccessManagedRequiredDelay(uint256 requiredDelay);
    error AccessManagedInvalidAuthority(address authority);
    function authority() public view virtual returns (address);
    function setAuthority(address newAuthority) public virtual;
    function isConsumingScheduledOp() public view virtual returns (bool);
    event AuthorityUpdated(address authority);
}