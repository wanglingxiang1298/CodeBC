pragma solidity ^0.8.20;
abstract contract Initializable {
    bool private _initialized;
    bool private _initializing;
    modifier initializer() {
        require(_initializing ||!_initialized, "Initializable: contract is already initialized");
        bool isTopLevelCall =!_initializing;
        _initializing =!isTopLevelCall;
        _;
        if (isTopLevelCall) {
            _initialized = true;
        }
        _initializing = false;
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
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        _initializing = uint64(-1);
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return _getInitializableStorage()._initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (InitializableStorage storage s) {
    }
    event Initialized(uint64 version);
}