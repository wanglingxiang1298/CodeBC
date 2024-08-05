pragma solidity ^0.8.20;
abstract contract Initializable {
    bool private _initialized;
    bool private _initializing;
    modifier initializer() {
        require(_initializing ||!_initialized, "Initializable: contract is already initialized");
        bool isTopLevelCall =!_initializing;
        _initializing =!_initialized;
        if (isTopLevelCall) {
            _initialize();
        }
        _;
        if (isTopLevelCall) {
            _finalize();
        }
        _initializing = false;
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: contract is not initialized");
        _;
        _finalize();
        _initializing = false;
    }
    modifier onlyInitializing() {
        require(_initializing, "Initializable: contract is not initializing");
        _;
    }
    function _getInitializableStorage() internal pure returns (bytes32) {
        return keccak256("Initializable.storage");
    }
    function _getInitializedVersion() internal view returns (uint64) {
        return uint64(uint256(keccak256(abi.encodePacked(_getInitializableStorage()))));
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _checkInitializing() internal view {
        require(_isInitializing(), "Initializable: contract is not initializing");
    }
    function _disableInitializers() internal {
        uint256 slot = uint256(keccak256(abi.encodePacked(_getInitializableStorage())));
        assembly {
            sstore(slot, 1)
        }
    }
    function _initialize() internal virtual initializer {}
    function _finalize() internal virtual initializer {}
}

