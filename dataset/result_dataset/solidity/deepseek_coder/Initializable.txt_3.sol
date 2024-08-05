pragma solidity ^0.8.20;
contract Initializable {
    uint256 private _initializedVersion = 0;
    bool private _initializing = false;
    struct InitializableStorage {
        uint256 _initialized;
        bool _initializing;
    }
    mapping(address => InitializableStorage) private _initializableStorages;
    uint256 constant INITIALIZABLE_STORAGE = 0x1234567890abcdef1234567890abcdef1234567890abcdef1234567890abcdef;
    event Initialized(uint256 version);
    modifier onlyInitializing() {
        require(_initializing, "Function can only be called during initialization");
        _;
    }
    modifier onlyReinitializing() {
        require(!_initializing, "Function can only be called after initialization");
        _;
    }
    function _checkInitializing() internal onlyInspect {
        require(_initializing, "Function can only be called during initialization");
    }
    function _disableInitializers() internal {
        _initializing = false;
        emit Initialized(0);
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initializedVersion;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (uint256) {
        return _initializableStorages[address]._initialized;
    }
    function initialize() external onlyOwner {
        require(!_initializing, "Initialization already in progress");
        _initializing = true;
        emit Initialized(0);
    }
    function reinitialize() external onlyOwner {
        require(_initializing, "Initialization not in progress");
        _disableInitializers();
        _initializing = true;
        emit Initialized(0);
    }
    function getInitializedVersion() public view returns (uint256) {
        require(_initializedVersion > 0, "Contract has not been initialized");
        return _initializedVersion;
    }
    function getInitializableStorage() external view returns (uint256) {
        require(_initializedVersion > 0, "Contract has not been initialized");
        return _getInitializableStorage();
    }
    modifier initializer() {
        require(!_initializing, "Initialization already in progress");
        _initializing = true;
        _initializedVersion++;
        emit Initialized(0);
        _;
    }
    modifier reinitializer() {
        require(_initializing, "Initialization not in progress");
        _disableInitializers();
        _initializing = true;
        emit Initialized(0);
        _;
    }
}