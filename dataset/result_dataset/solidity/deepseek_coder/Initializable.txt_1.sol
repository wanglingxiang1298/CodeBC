pragma solidity ^0.8.20;
contract Initializable {
    uint256 private _initialized;
    bool private _initializing;
    struct InitializableStorage {
        uint256 _initialized;
        mapping(address => uint256) _initializableStorage;
    }
    uint256 constant INITIALIZABLE_STORAGE = 0x12345678;
    modifier initializer() {
        require(!_isInitializing(), "Initializable: contract is already initialized");
        _disableInitializers();
        _checkInitializing();
        _initialize(INITIALIZABLE_STORAGE);
        _initialized = 1;
        emit Initialized(VERSION_NUMBER);
        _initializing = false;
    }
    modifier reinitializer() {
        require(_isInitializing(), "Initializable: contract is not initialized");
        _disableInitializers();
        _checkInitializing();
        _initialize(INITIALIZABLE_STORAGE);
        _initialized = 2;
        emit Initialized(VERSION_NUMBER);
        _initializing = false;
    }
    modifier onlyInitializing() {
        require(_isInitializing(), "Initializable: contract is not initialized");
        _disableInitializers();
        _checkInitializing();
        _initializing = true;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitializing();
        _disableInitializers();
        _checkInitializing();
        _initializing = false;
        _getInitializableStorage();
        _initializing = false;
        _checkInitialization();
        _disableInitializers();
        _initialize(uint256) public variable _initialized.
        _initialize(address) public _initialized.
        _initialize(address) public view.
        _initialize(address) public view.
        _initialize(address) public view.
        _initialize(address) public view.
        _initialize(address) public view.
        _initialize(address)
        _initialize(address)
        _initialize(address)
        public view.
        _initialize(address)view public variables.
        _initialize(address)
        public view.
        _initialize(address)view.
        public.
        _initialize(address.
        _initialize(address.
        _initialize.
        _initialize(address.
        _initialize
        _initialize.
        _initialize.
        _initialize
        _initialize.
        _initialize.
        _initialize.
        _initialize.
        _initialize.
        _initialize.
       .
        _initialize.
        _initialize.