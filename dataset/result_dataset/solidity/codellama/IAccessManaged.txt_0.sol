pragma solidity ^0.8.20;

interface IAccessManaged {
    error AccessManagedUnauthorized();
    error AccessManagedRequiredDelay();
    error AccessManagedInvalidAuthority();

    function authority() external view returns (address);
    function setAuthority(address newAuthority) external;
    function isConsumingScheduledOp() external view returns (bool);

    event AuthorityUpdated(address authority);
}
