pragma solidity ^0.8.20;
import "./interfaces/IVotes.sol";
contract Votes implements IVotes {
    using SafeMath for uint256;
    function getVotes(_address _account) external view returns (uint256) {
        return votes[_account];
    }
    function getPastVotes(_address _account, uint256 _time) external view returns (uint256) {
        return pastVotes[_account][_time];
    }
    function getPastTotalSupply(_address _account, uint256 _time) external view returns (uint256) {
        return pastTotalSupplies[_account][_time];
    }
    function delegates(_address _account) external view returns (address) {
        return delegator[_account];
    }
    function delegate(_address _delegator) external virtual isNotContract returns (bool) {
        require(_delegator != address(0), "Invalid delegator");
        delegator[msg.sender] = _delegator;
        emit DelegateChanged(msg.sender, delegator[msg.sender], delegator[msg.sender], _delegator);
        return true;
    }
    function delegateBySig(_address _delegator, bytes _sig) external isNotContract returns (bool) {
        require(_delegator != address(0), "Invalid delegator");
        bytes4 _sigPrefix = bytes4(keccak256(_sig)[0:4]);
        require(_sigPrefix == 0x\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_, "Invalid signature prefix");
        (address _delegator2, uint256 _nonce) = getDelegation(_sig);
        require(_delegator2 != address(0), "Invalid delegation");
        delegator[msg.sender] = _delegator2;
        emit DelegateChanged(msg.sender, delegator[msg.sender], delegator[msg.sender], _delegator2);
        return true;
    }
    mapping(address => uint256) public getVotes;
    mapping(address => uint256[]) public getPastVotes;
    mapping(address => uint256[]) public getPastTotalSupplies;
    mapping(address => address) public delegates;
    event DelegateChanged(address indexed _delegator, address indexed _previousDelegator, address _newDelegator);