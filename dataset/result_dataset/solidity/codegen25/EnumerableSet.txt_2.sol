pragma solidity ^0.8.20;
library EnumerableSet {
    function _add(set(bytes32) memory _set, bytes32 _value) internal returns (bytes32) as bytes32 {
        require(!_set.contains(_value), "Value already exists in set.");
        bytes32 newSet = empty();
        bytes32 prevValue;
        for (bytes32 value = _set; value != empty(); value = values(value)) {
            if (value != _value) {
                if (isEmpty(newSet)) {
                    newSet = add(newSet, value);
                } else {
                    prevValue = value;
                }
            } else {
                if (isEmpty(newSet)) {
                    newSet = add(newSet, _value);
                } else {
                    newSet = add(newSet, prevValue);
                    prevValue = _value;
                }
            }
        }
        return newSet;
    }
    function _remove(set(bytes32) memory _set, bytes32 _value) internal returns (bytes32) as bytes32 {
        require(_set.contains(_value), "Value does not exist in set.");
        bytes32 newSet = empty();
        for (bytes32 value = _set; value != empty(); value = values(value)) {
            if (value != _value) {
                newSet = add(newSet, value);
            }
        }
        return newSet;
    }
    function _contains(set(bytes32) memory _set, bytes32 _value) internal view returns (bool) {
        return _set.contains(_value);
    }
    function _length(set(bytes32) memory _set) internal view returns (uint256) {
        return _set.count();
    }
    function _at(set(bytes32) memory _set, uint256 _index) internal view returns (bytes32) {
        return _set.at(_index);
    }
    function _values(set(bytes32) memory _set) internal view returns (bytes32[]) as bytes32[] {
        return _set.values();
    }
    function empty() internal pure returns (bytes32) {
        return empty();
    }
    function add(bytes32[] memory _set, bytes32 _value) internal pure returns (bytes32[]) as bytes32[] {
        bytes32[] memory newSet = empty();
        if (_set.length == 0) {
            newSet = add(newSet, _value);
        } else {
            for (uint i = 0; i < _set.length; i++) {
                if (isEmpty(_set[i])) {
                    newSet = add(newSet, _value);
                } else {
                    newSet = add(newSet, _set[i]);
                }
            }
            newSet = add(newSet, _value);
        }
        return newSet;
    }
    function contains(bytes32[] memory _set, bytes32 _value) internal pure returns (bool) {
        return _set.contains(_value);
    }