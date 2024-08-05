pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address) external;
    function revokeAuthorityAccess(address) external;
    function delayAccess() external;
    function revokeDelayAccess() external;
    function isAuthorized(address) external view;
    function isDelayed() external view;
}