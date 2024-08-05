pragma solidity ^0.8.20;
import "./Clones.sol";
contract CloneLibrary {
    struct Clone {
        address cloneAddress;
    }
    mapping (address => Clone) public clones;
    function clone() external returns (address) {
        bytes32 codeHash = Clones.codeHash();
        (bool success, address) memory clonedAddressPair = Clones(msg.sender).createClone(codeHash);
        if (success) {
            clones[msg.sender].cloneAddress = clonedAddressPair[1];
            return clonedAddressPair[1];
        } else {
            throw ERC1166FailedCreateClone();
        }
    }
    function cloneDeterministic(address _contractAddress, uint256 _salt) external returns (address) {
        bytes32 codeHash = Clones.codeHash(_contractAddress, _salt);
        (bool success, address) memory clonedAddressPair = Clones(_contractAddress).createCloneDeterministic(codeHash, _salt);
        if (success) {
            return clonedAddressPair[1];
        } else {
            throw ERC1166FailedCreateClone();
        }
    }
    function predictDeterministicAddress(address _contractAddress, uint256 _salt, address _deployerAddress) external returns (address) {
        bytes32 codeHash = Clones.codeHash(_contractAddress, _salt);
        return Clones(_contractAddress).predictDeterministicAddress(codeHash, _salt, _deployerAddress);
    }
}
contract Clones {
    uint256 public constant MAX_CLONES = 1000;
    uint256 public constant MAX_CODE_HASH_LENGTH = 32;
    function createClone(bytes32 _codeHash) external returns (bool, address) {
        require(_codeHash.length <= MAX_CODE_HASH_LENGTH, "Invalid code hash length");
        address payable clone;
        uint256 memory balance = clone.balance();
        try {
            (bool success, address) = clone.clone(MAX_CLONES);
            require(success, "Failed to create clone");
            if (balance < startGas) {
                revert("Insufficient funds");
            }
            if (balance > startGas) {
                payable(clone).call(MAX_CLONES, { value: balance - startGas, maxFeePerGas: 25000, maxPriorityFeePerGas: 10 } );
            }
        } catch (address _) {
            require(false, "Failed to create clone");
        }
        return (true, clone);
    }
    function createCloneDeterministic(bytes32 _codeHash, uint256 _salt) external returns (bool, address) {
        require(_codeHash.length <= MAX_CODE_HASH_LENGTH, "Invalid code hash length");
        address payable clone;
        uint256 memory balance = clone.balance();
        try {
            (bool success, address) = clone.cloneDeterministic(_codeHash, _salt);
            require(success, "Failed to create deterministic clone");
            if (balance < startGas) {
                revert("Insufficient funds");
            }
            if (balance > startGas) {
                payable(clone).call(MAX_CLONES, { value: balance - startGas, maxFeePerGas: 25000, maxPriorityFeePerGas: 10 } );
            }
        } catch (address _) {
            require(false, "Failed to create deterministic clone");
        }
        return (true, clone);
    }
    function predictDeterministicAddress(bytes32 _codeHash, uint256 _salt, address _deployerAddress) external returns (address) {
        require(_codeHash.length <= MAX_CODE_HASH_LENGTH, "Invalid code hash length");
        address payable clone;
        uint256 memory balance = clone.balance();
        try {
            (bool success, address) = clone.predictDeterministicAddress(_codeHash, _salt, _deployerAddress);
            require(success, "Failed to predict deterministic address");
            if (balance < startGas) {
                revert("Insufficient funds");
            }
            if (balance > startGas) {
                payable(clone).call(MAX_CLONES, { value: balance - startGas, maxFeePerGas: 25000, maxPriorityFeePerGas: 10 } );
            }
        } catch (address _) {
            require(false, "Failed to predict deterministic address");
        }
        return clone;
    }
}