pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address) external;
    function revokeAuthorityAccess(address) external;
    function delayAccess() external;
    function revokeDelayAccess() external;
    function isScheduledOpDelayed() external view returns (bool);
    event AuthorityUpdated(address authority);
}