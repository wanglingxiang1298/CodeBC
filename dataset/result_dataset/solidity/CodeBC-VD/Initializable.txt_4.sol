pragma solidity ^0.8.20;
abstract contract Initializable {
    uint64 internal _initialized;
    bool internal _initializing;
    bytes32 internal constant INITIALIZABLE_STORAGE = keccak256("Initializable.storage");
    error InvalidInitialization();
    error NotInitializing();
    modifier initializer() {
        if (_initializing) {
            revert NotInitializing();
        }
        uint256 initialized = uint256(_initialized);
        if (initialized > 0) {
            revert InvalidInitialization();
        }
        _initializing = true;
        _;
        emit Initialized(uint64(block.timestamp));
        _initializing = false;
        _initialized = uint64(block.timestamp);
    }
    modifier reinitializer() {
        if (_initializing) {
            revert NotInitializing();
        }
        uint256 initialized = uint256(_initialized);
        if (initialized == 0) {
            revert InvalidInitialization();
        }
        _initializing = true;
        _;
        emit Initialized(uint64(block.timestamp));
        _initializing = false;
        _initialized = uint64(block.timestamp);
    }
    modifier onlyInitializing() {
        if (!_initializing) {
            revert NotInitializing();
        }
        _;
    }
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        if (_initializing) {
            _initialized = type(uint256).max;
        }
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return _initialized;
    }
    function _getInitializableStorage() internal pure returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
    event Initialized(uint64 version);
}