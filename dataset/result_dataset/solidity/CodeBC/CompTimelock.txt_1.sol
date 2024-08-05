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
    function owner() public view returns (address) {
        return _owner;
    }
    modifier onlyOwner() {
        require(_owner == _msgSender(), "Ownable: caller is not the owner");
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
    event QueueTransaction(bytes32 indexed txHash, address indexed from, address indexed to, uint256 value, string indexed signature, uint256 eta);
    event CancelTransaction(bytes32 indexed txHash, address indexed from, address indexed to, uint256 value, string indexed signature, uint256 eta);
    event ExecuteTransaction(bytes32 indexed txHash, address indexed from, address indexed to, uint256 value, string indexed signature, uint256 eta);
    event AdminTransaction(bytes32 indexed txHash, address indexed from, address indexed to, uint256 value, string indexed signature, uint256 eta);
    uint256 public constant delay = 4 weeks;
    uint256 public constant gracePeriod = 2 weeks;
    mapping (bytes32 => bool) public queuedTransactions;
    function setDelay(uint256 _delay) external onlyOwner {
        delay = _delay;
    }
    function admin() external view returns (address) {
        return owner();
    }
    function acceptAdmin() external {
        require(msg.sender == admin());
        _setAdmin(msg.sender);
    }
    function setPendingAdmin(address newPendingAdmin) external {
        require(msg.sender == admin());
        require(newPendingAdmin!= address(0));
        address oldPendingAdmin = pendingAdmin;
        pendingAdmin = newPendingAdmin;
        emit AdminTransaction(uint256(keccak256(abi.encodePacked('setPendingAdmin', msg.sender, newPendingAdmin))), msg.sender, newPendingAdmin, 0, '', 0);
        emit AdminTransaction(uint256(keccak256(abi.encodePacked('setPendingAdmin', msg.sender, newPendingAdmin))), msg.sender, admin(), 0, '', 0);
        _setAdmin(newPendingAdmin);
        emit AdminTransaction(uint256(keccak256(abi.encodePacked('setPendingAdmin', msg.sender, newPendingAdmin))), msg.sender, oldPendingAdmin, 0, '', 0);
    }
    function queueTransaction(address to, uint256 value, string memory signature, uint256 eta) public onlyOwner returns (bytes32) {
        require(eta > block.timestamp, 'CompTimelock: Queued transaction is executed before the eta');
        require(msg.sender == admin(), 'CompTimelock: User is not admin');
        bytes32 txHash = keccak256(abi.encodePacked(msg.sender, to, value, signature, eta));
        queuedTransactions[txHash] = true;
        emit QueueTransaction(txHash, msg.sender, to, value, signature, eta);
        return txHash;
    }
    function cancelTransaction(address to, uint256 value, string memory signature, uint256 eta) public onlyOwner returns (bytes32) {
        require(msg.sender == admin(), 'CompTimelock: User is not admin');
        bytes32 txHash = keccak256(abi.encodePacked(msg.sender, to, value, signature, eta));
        queuedTransactions[txHash] = false;
        emit CancelTransaction(txHash, msg.sender, to, value, signature, eta);
        return txHash;
    }
    function executeTransaction(address to, uint256 value, string memory signature, uint256 eta) public payable returns (bytes32) {
        require(msg.sender == admin(), 'CompTimelock: User is not admin');
        bytes32 txHash = keccak256(abi.encodePacked(msg.sender, to, value, signature, eta));
        require(queuedTransactions[txHash], 'CompTimelock: Transaction hasn\'t been queued');
        require(getBlockTimestamp() >= eta + delay, 'CompTimelock: Transaction hasn\'t surpassed the delay');
        require(getBlockTimestamp() <= eta + delay + gracePeriod, 'CompTimelock: Transaction is stale');
        queuedTransactions[txHash] = false;
        bytes memory txData = abi.encodePacked(to, value, signature, eta);
        (bool success, ) = to.call{value: value}(txData);
        require(success, 'CompTimelock: Transaction execution reverted');
        emit ExecuteTransaction(txHash, msg.sender, to, value, signature, eta