pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address _authority) external;
    function revokeAuthority() external;
    function isConsumingScheduledOp() view external;
    event AuthorityUpdated(address authority);
}