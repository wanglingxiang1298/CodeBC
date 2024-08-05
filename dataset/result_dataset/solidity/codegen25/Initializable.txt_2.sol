pragma solidity ^0.8.20;
contract Initializable {
    uint256 private _initialized;
    bool private _initializing;
    modifier onlyInitializing() {
        require(!_initializing, {code: 1});
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        yield({code: 1});
    }
    modifier onlyReinitializing() {
        require(_initializing, {code: 2});
        _disableInitializers();
        _initializing = true;
        _checkInitializing();
        _initializing = false;
        yield({code: 2});
    }
    modifier onlyNotInitializing() {
        require(!_initializing, {code: 3});
        yield({code: 3});
    }
    event Initialized(uint256 version);
    function _checkInitializing() internal {
        require(_initializing, {code: 4});
    }
    function _disableInitializers() internal {
        _initializing = false;
        emit Initialized(0);
    }
    function _getInitializedVersion() internal view returns (uint256) {
        return _initialized;
    }
    function _isInitializing() internal view returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view returns (uint256) {
        return 0x12345678;
    }
    constructor() {
        _initialized = 0;
        _initializing = false;
    }
    function init(uint256 version) external onlyNotInitializing {
        require(!_initialized, {code: 5});
        _initialized = version;
        emit Initialized(version);
    }
    function reinit() external onlyReinitializing {
        require(!_initialized, {code: 6});
        _initialized = 0;
        emit Initialized(0);
    }
}
interface InitializableStorage {
    function getInitializedVersion() public view returns (uint256);
    function setInitializedVersion(uint256 version) public;
}
contract InitializableStorage {
    uint256 private _initializedVersion;
    function getInitializedVersion() public view returns (uint256) {
        return _initializedVersion;
    }
    function setInitializedVersion(uint256 version) public {
        require(version != 0, {code: 7});
        _initializedVersion = version;
    }
}
constant INITIALIZABLE_STORAGE: bytes32 = "InitializableStorage";
contract ExampleContract is Initializable {
    using SafeMath for uint256;
    mapping(address => InitializableStorage) public _initializableStorages;
    function ExampleContract() {
        _initializableStorages[msg.sender] = InitializableStorage({
            code: _getInitializableStorage()
        });
    }
    function getInitializedVersion() public view override returns (uint256) {
        require(_isInitializing(), {code: 8});
        return _getInitializedVersion();
    }
    function init(uint256 version) public onlyNotInitializing override {
        require(version > 0, {code: 9});
        require(!_initialized, {code: 10});
        _initialized = version;
        emit Initialized(version);
    }
    function reinit() external onlyReinitializing override {
        require(!_initialized, {code: 11});
        _initialized = 0;
        emit Initialized(0);
    }
    function _checkInitializing() internal override {
        require(_isInitializing(), {code: 12});
    }
    function _disableInitializers() internal override {
        _initialized = 0;
        emit Initialized(0);
    }
    function _getInitializedVersion() internal view override returns (uint256) {
        return _initializedVersion;
    }
    function _isInitializing() internal view override returns (bool) {
        return _initializing;
    }
    function _getInitializableStorage() internal view override returns (uint256) {
        return _initializableStorages[msg.sender].getInitializedVersion();
    }
    function _setInitializedVersion(uint256 version) internal {
        require(version > 0, {code: 13});
        require(_initializedVersion == 0, {code: 14});
        _initializedVersion = version;
    }
}