pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address) external;
    function revokeAuthority() external;
    function delay() external;
    function delaySeconds() external;
    event AuthorityUpdated(address);
}