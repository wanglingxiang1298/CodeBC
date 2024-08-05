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
    bytes32 internal constant INITIALIZABLE_STORAGE = 0x7e735236a0b1dfcef31c805a3765c761c835cae53d348e3d7f4c06c14b3d32;
    struct InitializableStorage {
        uint64 _initialized;
        bool _initializing;
    }
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        _getInitializableStorage()._initialized = type(uint64).max;
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return _getInitializableStorage()._initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
}

