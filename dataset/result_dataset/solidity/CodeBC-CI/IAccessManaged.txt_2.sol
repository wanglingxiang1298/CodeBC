pragma solidity ^0.8.20;
contract AccessManaged {
    address public authority;
    bool public isScheduledOperation;
    event AuthorityUpdated(address indexed authority);
    modifier onlyAuthority {
        _;
    }
    modifier whenScheduledOperation {
        require(isConsumingScheduledOp(), "Scheduled operation not in progress");
        _;
    }
    constructor() {
        authority = msg.sender;
    }
    function getAuthority() external view returns (address) {
        return authority;
    }
    function setAuthority(address newAuthority) external onlyAuthority {
        require(newAuthority!= address(0), "AccessManaged: new authority is the zero address");
        authority = newAuthority;
        emit AuthorityUpdated(authority);
    }
    function isConsumingScheduledOp() public view returns (bool) {
        return isScheduledOperation;
    }
    modifier onlyScheduledOperation() {
        _;
    }
}