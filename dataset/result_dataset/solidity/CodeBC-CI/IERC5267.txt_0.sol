pragma solidity ^0.8.20;
contract EIP712DomainRegistry is IERC5267 {
    struct Domain {
        string fields;
        string name;
        string version;
        uint256 chainId;
        address verifyingContract;
        uint256 salt;
        mapping(string => string) extensions;
    }
    mapping(string => Domain) public domains;
    event EIP712DomainChanged(string indexed domainName, string indexed fields, string indexed name, string indexed version, uint256 indexed chainId, address indexed verifyingContract, uint256 salt);
    function eip712Domaines(string memory domainName) public view returns (string memory fields, string memory name, string memory version, uint256 chainId, address verifyingContract, uint256 salt, mapping(string => string) memory extensions) {
        Domain memory domain = domains[domainName];
        fields = domain.fields;
        name = domain.name;
        version = domain.version;
        chainId = domain.chainId;
        verifyingContract = domain.verifyingContract;
        salt = domain.salt;
        extensions = domain.extensions;
    }
    function addDomain(string memory domainName, string memory fields, string memory name, string memory version, uint256 chainId, address verifyingContract, uint256 salt) public {
        Domain storage domain = domains[domainName];
        domain.fields = fields;
        domain.name = name;
        domain.version = version;
        domain.chainId = chainId;
        domain.verifyingContract = verifyingContract;
        domain.salt = salt;
        emit EIP712DomainChanged(domainName, fields, name, version, chainId, verifyingContract, salt);
    }
    function updateDomain(string memory domainName, string memory fields, string memory name, string memory version, uint256 chainId, address verifyingContract, uint256 salt) public {
        Domain storage domain = domains[domainName];
        domain.fields = fields;
        domain.name = name;
        domain.version = version;
        domain.chainId = chainId;
        domain.verifyingContract = verifyingContract;
        domain.salt = salt;
        emit EIP712DomainChanged(domainName, fields, name, version, chainId, verifyingContract, salt);
    }
}