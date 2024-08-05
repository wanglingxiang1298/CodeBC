pragma solidity ^0.8.20;
import "@openzeppelin/contracts/access/Ownable.sol";
import "./IExecutable.sol";
contract CompTimelock is Ownable, IExecutable {
    uint256 private _delay;
    uint256 private _gracePeriod;
    mapping(uint256 => Transaction) private _transactions;
    event TransactionQueued(uint256 id, address sender, address recipient, uint256 value, uint256 eta);
    event TransactionCancelled(uint256 id);
    event TransactionExecuted(uint256 id);
    event TransactionUpdated(uint256 id, uint256 newEta);
    constructor(uint256 delay, uint256 gracePeriod) {
        _delay = delay;
        _gracePeriod = gracePeriod;
    }
    function setDelay(uint256 delay) public onlyAdmin {
        _delay = delay;
    }
    function acceptAdmin() public onlyPendingAdmin {
        _grantPendingAdmin(_msg.sender);
        _setPendingAdmin(_msg.sender);
    }
    function setPendingAdmin(address newAddress) public onlyOwner {
        _setPendingAdmin(newAddress);
    }
    function queueTransaction(address recipient, uint256 value, uint256 eta) public onlyAdmin {
        require(_transactions[block.timestamp].isEmpty(), "Timelock already in progress");
        uint256 id = _transactions[block.timestamp].getNextId();
        _transactions[block.timestamp].add(id, _msg.sender, recipient, value, eta);
        emit TransactionQueued(id, _msg.sender, recipient, value, eta);
    }
    function cancelTransaction(uint256 id) public onlyAdmin {
        _transactions[block.timestamp].remove(id);
        emit TransactionCancelled(id);
    }
    function executeTransaction(uint256 id) public onlyAdmin {
        Transaction memory transaction = _transactions[block.timestamp].get(id);
        require(_transactions[block.timestamp].has(id), "Invalid transaction ID");
        require(transaction.eta <= block.timestamp + _gracePeriod && block.timestamp >= transaction.eta + _delay, "Transaction delay or grace period not reached");
        _transactions[block.timestamp].remove(id);
        _execute(transaction.sender, transaction.recipient, transaction.value);
        emit TransactionExecuted(id);
    }
    function getBlockTimestamp() public view returns (uint256) {
        return block.timestamp;
    }
    function _execute(address sender, address recipient, uint256 value) private onlyAdmin {
        _transfer(sender, recipient, value);
    }
    modifier onlyAdmin() {
        require(msg.sender == admin(), "Unauthorized access");
        _;
    }
    modifier onlyPendingAdmin() {
        require(msg.sender == pendingAdmin(), "Unauthorized access");
        _;
    }
    struct Transaction {
        uint256[] public ids;
        mapping(uint256 => address) public senders;
        mapping(uint256 => address) public recipients;
        mapping(uint256 => uint256) public values;
        mapping(uint256 => uint256) public etas;
        uint256 public nextId;
        bool public isEmpty;
        function get(uint256 id) public view returns (uint256 sender, address recipient, uint256 value, uint256 eta) {
            require(_ids.length > 0, "Transaction not found");
            require(_ids.indexOf(id) != uint256(0), "Transaction not found");
            sender = _senders[id];
            recipient = _recipients[id];
            value = _values[id];
            eta = _etas[id];
            return (sender, recipient, value, eta);
        }
        function getNextId() public view returns (uint256) {
            return nextId;
        }
        function add(uint256 id, address sender, address recipient, uint256 value, uint256 eta) public {
            require(ids.length == 0 || etas[ids.length-1] < eta, "New transaction not delayed");
            ids.push(id);
            senders[id] = sender;
            recipients[id] = recipient;
            values[id] = value;
            etas[id] = eta;
            if (isEmpty) {
                isEmpty = false;
            }
        }
        function remove(uint256 id) public {
            require(ids.indexOf(id) != uint256(0), "Invalid transaction ID");
            ids.pop(ids.indexOf(id));
            senders.delete(id);
            recipients.delete(id);
            values.delete(id);
            etas.delete(id);
            if (ids.length == 0) {
                isEmpty = true;
            }
        }
        function has(uint256 id) public view returns (bool) {
            require(ids.length > 0, "Transaction list is empty");
            return ids.indexOf(id) != uint256(0);
        }
    }
}