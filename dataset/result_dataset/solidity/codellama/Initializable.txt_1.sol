pragma solidity ^0.8.20;

contract Initializable {
    struct InitializableStorage {
        uint64 _initialized;
        bool _initializing;
    }

    bytes32 constant INITIALIZABLE_STORAGE = keccak256("InitializableStorage");

    error InvalidInitialization();
    error NotInitializing();

    event Initialized(uint64 version);

    modifier initializer {
        require(isInitializing(), "Initialization not in progress");
        _;
    }

    modifier reinitializer {
        require(isInitializing(), "Reinitialization not in progress");
        _;
    }

    modifier onlyInitializing {
        require(isInitializing(), "Function can only be called during initialization");
        _;
    }

    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }

    function _disableInitializers() internal {
        _initializing = true;
    }

    function _getInitializedVersion() internal view returns (uint64) {
        return _initialized;
    }

    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }

    function _getInitializableStorage() internal view returns (InitializableStorage storage) {
        return InitializableStorage(INITIALIZABLE_STORAGE);
    }
}