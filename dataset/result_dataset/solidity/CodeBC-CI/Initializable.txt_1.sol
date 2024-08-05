pragma solidity ^0.8.20;
contract Initializable {
    uint64 private _initialized;
    bool private _initializing;
    bytes32 private constant INITIALIZABLE_STORAGE = keccak256("Initializable.storage");
    error InvalidInitialization();
    error NotInitializing();
    event Initialized(uint256 indexed version);
    modifier initializer() {
        _checkInitializing();
        _disableInitializers();
        emit Initialized(version);
        _initializing = false;
        _initialized = version;
    }
    modifier reinitializer() {
        _checkInitializing();
        _disableInitializers();
        emit Initialized(version);
        _initializing = false;
        _initialized = version;
    }
    modifier onlyInitializing() {
        require(_isInitializing(), "NotInitializing");
        _;
    }
    function _checkInitializing() internal view {
        require(!_initializing, "Initializing");
    }
    function _disableInitializers() internal {
        _initializing = true;
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
}
