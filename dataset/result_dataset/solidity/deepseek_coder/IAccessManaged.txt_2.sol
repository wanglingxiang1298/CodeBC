pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address _to, uint256 _delaySeconds, bytes memory _data, bytes memory _functionSignature) external;
    function revokeAuthority() external;
    function isConsumingScheduledOp() view external;
    event AuthorityUpdated(address authority);
}