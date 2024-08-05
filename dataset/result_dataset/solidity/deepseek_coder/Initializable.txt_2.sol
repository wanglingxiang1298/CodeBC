pragma solidity ^0.8.20;
contract Initializable {
    uint256 private _initialized;
    bool private _initializing;
    function initialize(uint256 version) external onlyOwner {
        require(!_initialized, "Contract has already been initialized");
        _initialized = version;
        _initializing = true;
    }
    modifier onlyInitializing() {
        require(_initializing, "Function can only be called during initialization");
        _initializing = false;
        _initialized = INITIALIZATION_VERSION;
        emit Initialized(VERSION);
        _initializing = true;
        _initialized = 0;
        yield();
    }
    modifier onlyReinitializing() {
        require(_initializing, "Function can only be called during reinitialization");
        _initializing = false;
        _initialized = 0;
        emit Initialized(VERSION);
        _initializing = true;
        yield();
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can perform this function");
        _;
    }
    function getInitializedVersion() public view returns (uint256) {
        return _initialized;
    }
    function _checkInitializing() private view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() private {
        _initializing = false;
        _initialized = 0;
        emit Initialized(VERSION);
    }
    function _getInitializedVersion() private view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() private view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() private view returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
}