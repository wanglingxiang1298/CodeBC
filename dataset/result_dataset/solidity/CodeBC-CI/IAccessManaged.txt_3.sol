pragma solidity >=0.8.20;
contract AccessManaged {
    address public authority;
    bool public consumingScheduledOp;
    event AuthorityUpdated(address indexed newAuthority);
    modifier onlyAuthority {
        require(msg.sender == authority, "AccessManagedUnauthorized");
        _;
    }
    modifier notConsumingScheduledOp {
        require(!consumingScheduledOp, "AccessManagedScheduledOp");
        _;
    }
    constructor() {
        authority = msg.sender;
    }
    function getAuthority() external view returns (address) {
        return authority;
    }
    function setAuthority(address newAuthority) external onlyAuthority {
        authority = newAuthority;
        emit AuthorityUpdated(authority);
    }
    function isConsumingScheduledOp() external view returns (bool) {
        return consumingScheduledOp;
    }
    function scheduleOperation(uint256 delay, bytes calldata data) external onlyAuthority notConsumingScheduledOp {
        consumingScheduledOp = true;
        address target = address(this);
        bytes4 sig = bytes4(keccak256(bytes(data)));
        assembly {
            let result := call(gas(), target, 0, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            let resultMemory := add(ptr, 0x20)
            call  emit AuthorityUpdated(authority);
    }
    function isConsumingScheduledOp() external view returns (bool) {
        return consumingScheduledOp;
    }
    function scheduleOperation(uint256 delay, bytes calldata data) external onlyAuthority notConsumingScheduledOp {
        consumingScheduledOp = true;
        address target = address(this);
        bytes4 sig = bytes4(keccak256(bytes(data)));
        assembly {
            let result := call(gas(), target, 0, add(data, 0x20), mload(data), 0, 0)
            let size := returndatasize()
            let ptr := mload(0x40)
            let resultMemory := add(ptr, 0x20)
            call(gas(), target, 0, resultMemory, size, 0, 0)
            switch result
            case 0 {
                revert(ptr, size)
            }
            default {
                return(ptr, size)
            }
        }
        consumingScheduledOp = false;
    }
}
