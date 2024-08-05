pragma solidity ^0.8.20;
interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function approve(address spender, uint256 amount) external returns (bool);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
}
interface IERC20Metadata is IERC20 {
    function name() external view returns (string memory);
    function symbol() external view returns (string memory);
    function decimals() external view returns (uint8);
}
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }
    function _msgData() internal view virtual returns (bytes calldata) {
        this; // silence state mutability warning without generating bytecode - see https://github.com/ethereum/solidity/issues/2691
        return msg.data;
    }
}
contract Ownable is Context {
    address private _owner;
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    constructor () {
        address msgSender = _msgSender();
        _owner = msgSender;
        emit OwnershipTransferred(address(0), msgSender);
    }
    function owner() public view virtual returns (address) {
        return _owner;
    }
    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }
    function renounceOwnership() public virtual onlyOwner {
        emit OwnershipTransferred(_owner, address(0));
        _owner = address(0);
    }
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner!= address(0), "Ownable: new owner is the zero address");
        emit OwnershipTransferred(_owner, newOwner);
        _owner = newOwner;
    }
}
contract CompTimelock is Ownable {
    string private constant NAME = "CompTimelock";
    event Deposit(address indexed depositor, uint256 amount);
    event Withdrawal(address indexed withdrawer, uint256 amount);
    event EmergencyWithdraw(address indexed account, uint256 amount);
    address public immutable compToken = 0x3d535F399149D35Ca49af39d5288dd9c35bDc7c;
    uint256 public immutable gracePeriod;
    uint256 public immutable delay;
    uint256 public admin;
    uint256 public pendingAdmin;
    mapping (uint256 => bool) public executed;
    mapping (uint256 => bool) public queued;
    mapping (uint256 => bool) public cancelled;
    mapping (address => uint256) public deposits;
    struct Transaction {
        address destination;
        uint256 amount;
        bytes data;
        uint256 eta;
        uint256 cancelAfter;
        bool executed;
    }
    Transaction[] public transactions;
    mapping (uint256 => mapping (address => bool)) public cancellationRequests;
    constructor () {
        admin = 1;
        pendingAdmin = 1;
        gracePeriod = 1 days;
        delay = 1 days;
    }
    function setDelay(uint256 _delay) external onlyOwner {
        delay = _delay;
    }
    function acceptAdmin() external {
        require(admin == msg.sender, "Timelock::acceptAdmin: caller is not admin");
        admin = pendingAdmin;
        pendingAdmin = 0;
        emit AdminChanged(admin, pendingAdmin);
    }
    function setPendingAdmin(address _newAdmin) external {
        require(admin == msg.sender, "Timelock::setPendingAdmin: caller is not admin");
        pendingAdmin = _newAdmin;
        emit AdminChanged(admin, pendingAdmin);
    }
    function queueTransaction(address destination, uint256 amount, bytes memory data, uint256 eta) public onlyOwner returns (uint256) {
        require(destination!= address(0), "Timelock::queueTransaction: destination is zero address");
        require(eta > block.timestamp, "Timelock::queueTransaction: expected eta is before the current time");
        require(amount > 0, "Timelock::queueTransaction: amount is zero");
        require(eta >= block.timestamp + delay, "Timelock::queueTransaction: Specified eeta is before the grace period");
        uint256 transactionId = transactions.length;
        transactions.push(Transaction({
            destination: destination,
            amount: amount,
            data: data,
            eta: eta,
            cancelAfter: block.timestamp + gracePeriod,
            executed: false
        }));
        queued[transactionId] = true;
        emit QueueTransaction(transactionId, destination, amount, data, eta);
        return transactionId;
    }
    function cancelTransaction(uint256 transactionId) public onlyOwner {
        require(queued[transactionId], "Timelock::cancelTransaction: Transaction hasn't been queued");
        require(block.timestamp < transactions[transactionId].eta, "Timelock::cancelTransaction: Transaction has already been executed or expired");
        require(block.timestamp < transactions[transactionId].cancelAfter, "Timelock::cancelTransaction: Transaction was executed too long ago");
        queued[transactionId] = false;
        cancelled[transactionId] = true;
        emit CancelTransaction(transactionId);
    }
    function executeTransaction(uint256 transactionId) public onlyOwner {
        require(queued[transactionId], "Timelock::executeTransaction: Transaction hasn't been queued");
        require(block.timestamp >= transactions[transactionId].eta, "Timelock::executeTransaction: Transaction hasn't yet reached its eta");
        require(!executed[transactionId], "Timelock::executeTransaction: Transaction has already been executed");
        executed[transactionId] = true;
        Transaction memory transaction = transactions[transactionId];
        bytes memory returnData = execute(transaction.destination, transaction.amount, transaction.data);
        emit ExecuteTransaction(transactionId, transaction.destination, transaction.amount, transaction.data, returnData);
    }
    function execute(address destination, uint256 amount, bytes memory data) internal returns (bytes memory) {
        (bool success, bytes memory