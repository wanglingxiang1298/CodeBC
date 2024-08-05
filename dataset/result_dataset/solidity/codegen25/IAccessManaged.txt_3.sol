pragma solidity ^0.8.20;
interface IAccessManaged {
    function authorize(address _to, uint256 delaySeconds, bytes memory _data, bytes memory _functionSignature) external;
    function revokeAuthorization(address _to) external;
    event AuthorityUpdated(address _authority);
}