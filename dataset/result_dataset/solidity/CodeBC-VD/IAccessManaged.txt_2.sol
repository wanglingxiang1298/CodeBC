pragma solidity ^0.8.20;
interface IAccessManaged {
    error AccessManagedUnauthorized();
    error AccessManagedRequiredDelay(uint256 currentTime, uint256 requiredDelay);
    error AccessManagedInvalidAuthority(address authority);
    event AuthorityUpdated(address authority);
    function authority() external view returns (address);
    function setAuthority(address newAuthority) external;
    function isConsumingScheduledOp() external view returns (bool);
}