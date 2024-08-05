pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/utils/EnumerableSet.sol";

contract MyContract {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using EnumerableSet for EnumerableSet.AddressSet;
    using EnumerableSet for EnumerableSet.UintSet;

    EnumerableSet.Bytes32Set private bytes32Set;
    EnumerableSet.AddressSet private addressSet;
    EnumerableSet.UintSet private uintSet;

    constructor() public {
        bytes32Set = new EnumerableSet.Bytes32Set();
        addressSet = new EnumerableSet.AddressSet();
        uintSet = new EnumerableSet.UintSet();
    }

    function _add(bytes32 value) public {
        bytes32Set.add(value);
    }

    function _remove(bytes32 value) public {
        bytes32Set.remove(value);
    }

    function _contains(bytes32 value) public view returns (bool) {
        return bytes32Set.contains(value);
    }

    function _length() public view returns (uint) {
        return bytes32Set.length();
    }

    function _at(uint index) public view returns (bytes32) {
        return bytes32Set.at(index);
    }

    function _values() public view returns (bytes32[] memory) {
        return bytes32Set.values();
    }
}