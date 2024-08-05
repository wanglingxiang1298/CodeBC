pragma solidity ^0.8.20;
import "./IERC20.sol";
import "./ILock.sol";
contract CompTimelock {
    uint constant DELAY_THRESHOLD = 3600; // 1 hour
    uint constant GRACE_PERIOD = 7200; // 2 hours
    role admin;
    role pendingAdmin;
    mapping(address => uint) private transactionQueue;
    event TransactionQueued(uint delay, address sender, address receiver, uint amount);
    event TransactionCancelled(uint id);
    event TransactionExecuted(uint id);
    constructor() public {
        admin = _msg.sender;
        _setDelay(DELAY_THRESHOLD);
    }
    function _setDelay(uint delay) public onlyAdmin {
        DELAY_THRESHOLD = delay;
    }
    function acceptAdmin() public onlyPendingAdmin {
        admin = _msg.sender;
        pendingAdmin = _msg.sender;
    }
    function setPendingAdmin(address newAdmin) public onlyAdmin {
        pendingAdmin = newAdmin;
    }
    function queueTransaction(address receiver, uint amount, uint delay) public onlyAdmin {
        uint timestamp = block.timestamp;
        uint eta = timestamp + delay;
        transactionQueue[msg.sender] = (receiver, amount, eta);
        emit TransactionQueued(delay, msg.sender, receiver, amount);
    }
    function cancelTransaction(uint id) public onlyAdmin {
        (address receiver, uint amount, uint eta) = transactionQueue[id];
        delete transactionQueue[id];
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint id) public onlyAdmin {
        (address receiver, uint amount, uint eta) = transactionQueue[id];
        if (block.timestamp >= eta && block.timestamp <= eta + GRACE_PERIOD) {
            IERC20(receiver).transfer(amount, "");
            emit TransactionExecuted(id);
        } else {
            emit TransactionFailed(id);
        }
    }
    function getBlockTimestamp() public view returns (uint) {
        return block.timestamp;
    }
}