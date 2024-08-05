pragma solidity ^0.8.20;
interface IAccessManaged {
    event AuthorityUpdated(address indexed authority);
    function authority() external view returns (address);
    function setAuthority(address newAuthority) external;
    function isConsumingScheduledOp() external view returns (bool);
}