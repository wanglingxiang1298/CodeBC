pragma solidity ^ 0.8.20;
contract EnumerableSet {
    enum SetType {
        Bytes32Set,
        AddressSet,
        UintSet
    }
    struct Set {
        SetType setType;
        uint256[] elements;
    }
    function add(SetType setType, uint256 element) external {
        uint256 setIndex = getSetIndex(setType);
        EnumerableSet(setType, [setIndex])._add(element);
    }
    function remove(SetType setType, uint256 element) external {
        uint256 setIndex = getSetIndex(setType);
        EnumerableSet(setType, [setIndex])._remove(element);
    }
    function contains(SetType setType, uint256 element) external view returns (bool) {
        uint256 setIndex = getSetIndex(setType);
        return EnumerableSet(setType, [setIndex])._contains(element);
    }
    function length(SetType setType) external view returns (uint256) {
        uint256 setIndex = getSetIndex(setType);
        return EnumerableSet(setType, [setIndex])._length();
    }
    function at(SetType setType, uint256 index) external view returns (uint256) {
        uint256 setIndex = getSetIndex(setType);
        return EnumerableSet(setType, [setIndex])._at(index);
    }
    function values(SetType setType) external view returns (uint256[]) {
        uint256 setIndex = getSetIndex(setType);
        return EnumerableSet(setType, [setIndex])._values();
    }
    function getSetIndex(SetType setType) private view returns (uint256) {
        switch (setType) {
            case SetType.Bytes32Set:
                return 1;
            case SetType.AddressSet:
                return 2;
            case SetType.UintSet:
                return 3;
            default:
                revert("Invalid set type");
        }
    }
}