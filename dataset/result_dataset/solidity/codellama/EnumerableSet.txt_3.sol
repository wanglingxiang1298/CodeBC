pragma solidity ^0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-solidity/contracts/utils/EnumerableSet.sol";

contract MyContract {
    using EnumerableSet for EnumerableSet.Bytes32Set;
    using EnumerableSet for EnumerableSet.AddressSet;
    using EnumerableSet for EnumerableSet.UintSet;

    EnumerableSet.Bytes32Set private _bytes32Set;
    EnumerableSet.AddressSet private _addressSet;
    EnumerableSet.UintSet private _uintSet;

    function _add(bytes32 value) public {
        _bytes32Set.add(value);
    }

    function _remove(bytes32 value) public {
        _bytes32Set.remove(value);
    }

    function _contains(bytes32 value) public view returns (bool) {
        return _bytes32Set.contains(value);
    }

    function _length() public view returns (uint) {
        return _bytes32Set.length();
    }

    function _at(uint index) public view returns (bytes32) {
        return _bytes32Set.at(index);
    }

    function _values() public view returns (bytes32[] memory) {
        return _bytes32Set.values();
    }
}