pragma solidity ^0.8.20;
abstract contract Initializable {
    uint64 private _initialized;
    bool private _initializing;
    event Initialized(uint256 indexed version);
    function _initializableCheckInitializing() internal view virtual {
        require(!_initializing, NotInitializing());
    }
    function _initializableDisableInitializers() internal virtual {
        require(_initializing, "Initializable: contract is not initializing");
        _initialized = type(uint64).max;
    }
    function _initializableGetInitializedVersion() internal view virtual returns (uint64) {
        return _initialized;
    }
    function _initializableIsInitializing() internal view virtual returns (bool) {
        return _initializing;
    }
    function _initializableGetInitializableStorage() internal pure virtual returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
    modifier initializer() {
        require(_initializing, "Initializable: contract is not initializing");
        _initializing = false;
        _initialized = 1;
        _initialize();
        emit Initialized(1);
        _;
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: contract is not initializing");
        uint64 _initializedVersion = _initializableGetInitializedVersion();
        _initializing = false;
        _initialize();
        emit Initialized(_initializedVersion + 1);
        _;
    }
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }
    function _initialize() internal virtual {}
}
