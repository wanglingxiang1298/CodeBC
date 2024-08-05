pragma solidity ^0.8.20;
import "./IExecutable.sol";
import "./IERC20.sol";
import "./ILockable.sol";
contract CompTimelock is IExecutable, ILockable {
    uint256 private _delay;
    address private _admin;
    address private _pendingAdmin;
    mapping(uint256 => Transaction) private _transactions;
    event TransactionQueued(uint256 id, address sender, address recipient, uint256 amount, uint256 eta);
    event TransactionCancelled(uint256 id);
    event TransactionExecuted(uint256 id);
    function CompTimelock(uint256 delay_) public {
        _delay = delay_;
    }
    function setDelay(uint256 delay_) public onlyAdmin {
        _delay = delay_;
    }
    function acceptAdmin() public onlyPendingAdmin {
        _pendingAdmin = msg.sender;
    }
    function setPendingAdmin(address payable newAdmin_) public onlyAdmin {
        _pendingAdmin = newAdmin_;
    }
    function queueTransaction(Transaction.Data data, uint256 eta_) public onlyAdmin {
        require(data.value > 0 && data.recipient.address != address(0) && data.eta > block.timestamp, "Invalid transaction data");
        uint256 id = _transactions.length++;
        _transactions[id] = Transaction({
            sender: msg.sender,
            recipient: data.recipient,
            value: data.value,
            eta: eta_,
            executed: false
        });
        emit TransactionQueued(id, msg.sender, data.recipient, data.value, eta_);
    }
    function cancelTransaction(uint256 id) public onlyAdmin {
        require(_transactions[id].sender == msg.sender || hasRole(msg.sender, "admin"), "Unauthorized attempt to cancel transaction");
        _transactions[id].eta = 0;
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint256 id) public onlyAdmin {
        require(_transactions[id].eta <= block.timestamp && !_transactions[id].executed, "Invalid or already executed transaction");
        _transactions[id].executed = true;
        _transactions[id].sender.transfer(_transactions[id].value);
        emit TransactionExecuted(id);
    }
    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
    modifier onlyAdmin() {
        require(msg.sender == _admin || hasRole(msg.sender, "admin"), "Unauthorized attempt to modify contract state");
        _;
    }
    modifier onlyPendingAdmin() {
        require(msg.sender == _pendingAdmin, "Unauthorized attempt to accept contract change");
        _;
    }
}
contract Transaction {
    struct Data {
        address recipient;
        uint256 value;
        uint256 eta;
    }
    address payable sender;
    Data data;
    bool executed;
}