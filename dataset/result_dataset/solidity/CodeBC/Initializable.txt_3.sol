pragma solidity ^0.8.20;
abstract contract Initializable {
    bool private _initialized;
    bool private _initializing;
    modifier initializer() {
        require(_initializing ||!_initialized, "Initializable: contract is already initialized");
        bool isTopLevelCall =!_initializing;
        if (isTopLevelCall) {
            _initializing = true;
            _initialized = true;
        }
        _;
        if (isTopLevelCall) {
            _initializing = false;
            emit Initialized(_getInitializableStorage()._initialized);
        }
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: contract is not initialized");
        _;
        _initializing = false;
        emit Initialized(_getInitializableStorage()._initialized);
    }
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }
    function _getInitializableStorage() internal pure returns (InitializableStorage storage s) {
    }
    event Initialized(uint64 indexed version);
    bytes32 internal constant INITIALIZABLE_STORAGE = 0x7e735236a0b1dfcef31938d13a0b7cd6179d83ea2d81da6782269de4a1a3ed;
    struct InitializableStorage {
        uint64 _initialized;
        bool _initializing;
    }
    uint256 internal constant _INITIALIZED_VERSION = 1;
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        require(_initializing, "Initializable: contract is not initializing");
        _initializing = false;
        _initialized = type(uint64).max;
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return _INITIALIZED_VERSION;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
}

