pragma solidity ^0.8.20;
library EnumerableSet {
    struct Set {
        bytes32[] _values;
        mapping(bytes32 => uint256) _indexes;
    }
    function _add(Set storage set, bytes32 value) internal returns (bool) {
        if (!_contains(set, value)) {
            set._values.push(value);
            set._indexes[value] = set._values.length;
            return true;
        } else {
            return false;
        }
    }
    function _remove(Set storage set, bytes32 value) internal returns (bool) {
        uint256 valueIndex = set._indexes[value];
        if (valueIndex!= 0) {
            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastItemIndex = set._values.length - 1;
            bytes32 lastItem = set._values[lastItemIndex];
            set._values[toDeleteIndex] = lastItem;
            set._indexes[lastItem] = toDeleteIndex + 1;
            set._values.pop();
            delete set._indexes[value];
            return true;
        } else {
            return false;
        }
    }
    function _contains(Set storage set, bytes32 value) internal view returns (bool) {
        return set._indexes[value]!= 0;
    }
    function _length(Set storage set) internal view returns (uint256) {
        return set._values.length;
    }
    function _at(Set storage set, uint256 index) internal view returns (bytes32) {
        return set._values[index];
    }
    function _values(Set storage set) internal view returns (bytes32[] memory) {
        return set._values;
    }
}
