pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address) external;
    function revokeAuthority() external;
    function delay(uint) external;
    function delayUntil(uint) external;
    event AuthorityUpdated(address authority);
}