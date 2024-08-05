pragma solidity ^0.8.20;
contract Initializable {
    uint64 private _initialized;
    bool private _initializing;
    bytes32 private constant INITIALIZABLE_STORAGE = keccak256("Initializable.storage");
    event Initialized(uint256 indexed version);
    modifier initializer() {
        require(_initializing, "Initializable: Contract is not initializing");
        _;
    }
    modifier reinitializer() {
        require(_initializing, "Initializable: Contract is not initializing");
        _;
    }
    modifier onlyInitializing() {
        require(_initializing, "Initializable: Contract is not initializing");
        _;
    }
    function _checkInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _disableInitializers() internal {
        uint256 c = _initialized;
        require(c!= 1, "Initializable: Contract is already initialized");
        _initializing = false;
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (bytes32) {
        return INITIALIZABLE_STORAGE;
    }
}