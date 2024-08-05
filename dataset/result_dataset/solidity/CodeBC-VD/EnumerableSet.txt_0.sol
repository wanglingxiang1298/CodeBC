pragma solidity ^0.8.20;
library EnumerableSet {
    struct Set {
        bytes32[] _values;
        mapping(bytes32 => uint256) _indexes;
    }
    function _add(Set storage set, bytes32 value) private {
        if (!_contains(set, value)) {
            set._values.push(value);
            set._indexes[value] = set._values.length;
        }
    }
    function _remove(Set storage set, bytes32 value) private {
        uint256 valueIndex = set._indexes[value];
        if (valueIndex!= 0) {
            uint256 toDeleteIndex = valueIndex - 1;
            uint256 lastIndex = set._values.length;
            bytes32 lastvalue = set._values[lastIndex];
            set._values[toDeleteIndex] = lastvalue;
            set._indexes[lastvalue] = toDeleteIndex + 1;
            set._values.pop();
            delete set._indexes[value];
        }
    }
    function _contains(Set storage set, bytes32 value) private view returns (bool) {
        return set._indexes[value]!= 0;
    }
    function _length(Set storage set) private view returns (uint256) {
        return set._values.length;
    }
    function _at(Set storage set, uint256 index) private view returns (bytes32) {
        return set._values[index];
    }
    function _values(Set storage set) private view returns (bytes32[] memory) {
        return set._values;
    }
}

