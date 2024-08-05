pragma solidity ^0.8.20;
contract Initializable {
    uint256 private _initialized;
    bool private _initializing;
    modifier onlyInitializing() {
        require(!_initializing, "Contract is not currently initializing");
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        return _initializing;
    }
    modifier onlyNotInitializing() {
        require(_initializing, "Contract is currently initializing");
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        return _initializing;
    }
    modifier onlyReinitializing() {
        require(_initializing, "Contract is not currently reinitializing");
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        return _initializing;
    }
    modifier onlyNotReinitializing() {
        require(!_initializing, "Contract is currently reinitializing");
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        return _initializing;
    }
    event Initialized(uint256 version);
    function _checkInitializing() internal {
        require(_initializing, "Initialization process has been interrupted");
    }
    function _disableInitializers() internal {
        _initializing = false;
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (uint256) {
        return 0x1234567890abcdef;
    }
    function initialize(uint256 version) external onlyNotInitializing {
        require(!_initialized, "Contract has already been initialized");
        _disableInitializers();
        _initialized = version;
        Initialized(version);
    }
    function reinitialize() external onlyNotReinitializing {
        require(_initialized, "Contract has not been initialized");
        _disableInitializers();
        _initialized = 0;
        Initialized(0);
    }
}
interface InitializableStorage {
    uint256 public constant INITIALIZABLE_STORAGE;
    function uint256 getInitializedVersion() external view returns (uint256);
}
contract InitializableStorage {
    uint256 private _initializedVersion;
    function INITIALIZABLE_STORAGE() {
        _initializedVersion = 0;
    }
    function getInitializedVersion() external view returns (uint256) {
        return _initializedVersion;
    }
    function setInitializedVersion(uint256 version) external onlyInitializing {
        require(version > 0, "Invalid version number");
        _initializedVersion = version;
    }
}