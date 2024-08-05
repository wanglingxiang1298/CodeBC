pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address) external;
    function revokeAuthority() external;
    function delayAccess() external;
    function getDelayPeriod() external view;
    function getAuthority() external view;
    event AuthorityUpdated(address authority);
}