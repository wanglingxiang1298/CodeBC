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
    function _checkInitializing() internal onlyInTheInitializer modifier {
        require(_initializing, "Function can only be called during initialization");
    }
    function _disableInitializers() internal {
        _initializing = false;
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initializedVersion;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal pure returns (InitializableStorage memory) {
        InitializableStorage memory storage = new InitializableStorage();
        storage.address = INITIALIZABLE_STORAGE;
        return storage;
    }
    function initialize() external onlyOwner {
        require(!_initializing, "Initialization already in progress");
        _initializing = true;
        _initializedVersion = 0;
        emit Initialized(0);
    }
    function reinitialize() external onlyOwner {
        require(_initializing, "Initialization not in progress");
        _disableInitializers();
        _initializedVersion = 0;
        emit Initialized(0);
    }
    function isInitialized() public view returns (bool) {
        return _initializedVersion > 0;
    }
    function getInitializedVersion() public view returns (uint256) {
        return _initializedVersion;
    }
    modifier initializer() {
        require(!_initializing, "Initialization already in progress");
        _initializing = true;
        _initializedVersion = 0;
        emit Initialized(0);
        _;
    }
    modifier reinitializer() {
        require(_initializing, "Initialization not in progress");
        _disableInitializers();
        _initializedVersion = 0;
        emit Initialized(0);
        _;
    }
    function() external onlyInitializing() {
        require(!_initializing, "Function can only be called during initialization");
        _;
    }
    function() external onlyReinitializing() {
        require(_initializing, "Function can only be called after initialization");
        _;
    }
    modifier onlyWithInitializedVersion(uint256 version) {
        require(isInitialized(), "Contract is not initialized");
        require(_initializedVersion == version, "Invalid version");
        _;
    }
    modifier onlyWithInitializedVersionAndPermissions(uint256 version, bool hasPermission) {
        require(isInitialized(), "Contract is not initialized");
        require(_initializedVersion == version, "Invalid version");
        require(hasPermission, "Permission not granted");
        _;
    }
}