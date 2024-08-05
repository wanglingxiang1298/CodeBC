pragma solidity ^0.8.20;
contract InitializableStorage {
    uint256 private _initialized;
    bool private _initializing;
    function InitializableStorage() {
        _initialized = 0;
        _initializing = false;
    }
    function setInitializableStorage(uint256 newStorage) external onlyOwner {
        require(!_initializing, InvalidInitialization("Contract is already initializing."));
        _initialized = newStorage;
        emit Initialized(VERSION);
    }
    function isInitialized() public view returns (bool) {
        return _initialized > 0;
    }
    function isInitializing() public view returns (bool) {
        return _initializing;
    }
    function getInitializedVersion() public view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() private view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() private view returns (uint256) {
        return _initialized;
    }
    modifier public requiresInitialized() {
        require(isInitialized(), InvalidInitialization("Contract is not initialized."));
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        emit Initialized(VERSION);
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _reenterInitialization();
        _initializing = false;
        _initialized = VERSION;
        _initializing = false;
        _initialized = false;
        _initializing = false;
        _initializing = false;
        _initializing = true;
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing =
        _initializing
        _initializing =
        _initializing
        _initializing=
        _initializing
        _initializing =
        _initializing=initializing
        _initializing=
        _initializing=
        _initializing=