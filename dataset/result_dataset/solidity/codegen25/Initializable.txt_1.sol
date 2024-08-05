pragma solidity ^0.8.20;
contract Initializable {
    using SafeMath for uint256;
    struct InitializableStorage {
        uint64 _initialized;
        bool _initializing;
    }
    constant bytes32 _INITIALIZABLE_STORAGE = "InitializableStorage";
    mapping(address => uint256) private _initializedVersion;
    mapping(address => InitializableStorage) private _initializableStorage;
    error InvalidInitialization = 1;
    error NotInitializing = 2;
    modifier onlyInitializing() {
        require(!isInitializing(), "Only initializing functions can be called");
        _;
    }
    modifier onlyReinitializing() {
        require(isInitializing(), "Only reinitializing functions can be called");
        _;
    }
    modifier initializer() {
        require(!isInitializing(), "Function can only be called during initialization");
        _checkInitializing();
        _disableInitializers();
        _initializedVersion[msg.sender] = 0;
        _initializableStorage[msg.sender] = InitializableStorage(0, false);
        _;
    }
    modifier reinitializer() {
        require(isInitializing(), "Function can only be called during initialization");
        _;
    }
    function _checkInitializing() private {
        require(_initializableStorage[msg.sender]._initializing, "Initialization is not currently in progress");
    }
    function _disableInitializers() private {
        _initializableStorage[msg.sender]._initializing = false;
        emit Initialized(msg.sender, _initializedVersion[msg.sender]);
    }
    function _getInitializedVersion(address _address) private view returns (uint256) {
        return _initializedVersion[_address];
    }
    function _getInitializableStorage() private view returns (InitializableStorage) {
        return _initializableStorage[msg.sender];
    }
    function _isInitializing() private view returns (bool) {
        return _initializableStorage[msg.sender]._initializing;
    }
    function initialize() public onlyReinitializing {
        _initializableStorage[msg.sender]._initializing = true;
        emit Initialized(msg.sender, _initializedVersion[msg.sender]);
    }
    function isInitialized() public view returns (bool) {
        return _initializedVersion[msg.sender] > 0;
    }
    function isInitializing() public view returns (bool) {
        return _initializableStorage[msg.sender]._initializing;
    }
    function isReinitializing() public view returns (bool) {
        return _initializableStorage[msg.sender]._initializing;
    }
    function initializedVersion() public view returns (uint256) {
        return _initializedVersion[msg.sender];
    }
    function() external onlyInitializing {
    }
    function() external onlyReinitializing {
    }
}