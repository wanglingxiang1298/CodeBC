pragma solidity ^0.8.20;
abstract contract Initializable {
    uint64 private _initialized;
    bool private _initializing;
    event Initialized(uint256 indexed version);
    modifier initializer() {
        require(_initializing, "Initializable: contract is not initializing");
        require(_initialized < 2, "Initializable: contract is already initialized");
        _;
        _initializing = false;
        emit Initialized(uint256(++_initialized));
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: contract is not initializing");
        require(_initialized >= 2, "Initializable: contract is not initialized");
        _;
        emit Initialized(uint256(_initialized));
    }
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        require(_initializing, "Initializable: contract is not initializing");
        _initializing = true;
        _initialized = type(uint64).max;
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return _initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal pure returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
}