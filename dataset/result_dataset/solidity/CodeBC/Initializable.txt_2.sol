pragma solidity ^0.8.20;
abstract contract Initializable {
    bool private _initialized;
    bool private _initializing;
    uint256 private _lock;
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
            _lock = 0;
            emit Initialized(_getInitializedVersion());
        }
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
        _initializing = false;
        _lock = 0;
        emit Initialized(_getInitializedVersion());
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
        uint256 value = (uint256(1) << 255);
        _lock = value - 1;
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _lock;
    }
    function _getInitializableStorage() internal pure returns (bytes32) {
        return keccak256("Initializable.storage");
    }
    event Initialized(uint256 version);
}
