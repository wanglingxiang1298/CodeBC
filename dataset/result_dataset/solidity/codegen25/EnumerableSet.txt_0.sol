pragma solidity ^0.8.20;
contract EnumerableSet {
    bytes32Set private bytes32Set;
    addressSet private addressSet;
    uintSet private uintSet;
    function _add(bytes32 memory _value) public {
        bytes32Set.add(_value);
    }
    function _add(address _value) public {
        addressSet.add(_value);
    }
    function _add(uint256 _value) public {
        uintSet.add(_value);
    }
    function _remove(bytes32 memory _value) public {
        bytes32Set.remove(_value);
    }
    function _remove(address _value) public {
        addressSet.remove(_value);
    }
    function _remove(uint256 _value) public {
        uintSet.remove(_value);
    }
    function _contains(bytes32 memory _value) internal view returns (bool) {
        return bytes32Set.contains(_value);
    }
    function _contains(address _value) internal view returns (bool) {
        return addressSet.contains(_value);
    }
    function _contains(uint256 _value) internal view returns (bool) {
        return uintSet.contains(_value);
    }
    function _length() internal view returns (uint256) {
        return bytes32Set.size();
    }
    function _at(uint256 _index) internal view returns (bytes32, address, uint256) {
        bytes32 memory _value;
        address memory _address;
        uint256 _uint;
        bytes32Set.get(_index, _value);
        addressSet.get(_index, _address);
        uintSet.get(_index, _uint);
        return (_value, _address, _uint);
    }
    function _values() internal view returns (bytes32[], address[], uint256[]) {
        bytes32[] memory _values;
        address[] memory _addresses;
        uint256[] memory _uints;
        bytes32Set.getAll(_values);
        addressSet.getAll(_addresses);
        uintSet.getAll(_uints);
        return (_values, _addresses, _uints);
    }
}