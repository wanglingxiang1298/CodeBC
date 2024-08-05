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

    modifier initializer() {
        require(_checkInitializing(), "Initialization not in progress");
        _;
    }

    modifier reinitializer() {
        require(_checkInitializing(), "Reinitialization not in progress");
        _;
    }

    modifier onlyInitializing() {
        require(_isInitializing(), "Not initializing");
        _;
    }

    function _checkInitializing() internal view returns (bool) {
        return InitializableStorage(INITIALIZABLE_STORAGE)._initializing;
    }

    function _disableInitializers() internal {
        InitializableStorage(INITIALIZABLE_STORAGE)._initializing = true;
    }

    function _getInitializedVersion() internal view returns (uint64) {
        return InitializableStorage(INITIALIZABLE_STORAGE)._initialized;
    }

    function _isInitializing() internal view returns (bool) {
        return InitializableStorage(INITIALIZABLE_STORAGE)._initializing;
    }

    function _getInitializableStorage() internal view returns (InitializableStorage storage) {
        return InitializableStorage(INITIALIZABLE_STORAGE);
    }
}