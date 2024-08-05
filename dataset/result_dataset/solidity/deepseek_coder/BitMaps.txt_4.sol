solidity^0.8.20
library BitMaps {
    function get(uint256 index) public view returns (bool) {
        uint256 mappedIndex = mapIndex(index);
        uint256 byteIndex = mappedIndex / 8;
        uint256 bitIndex = mappedIndex % 8;
        uint256 byteValue = data[byteIndex];
        return (byteValue >> bitIndex) & 1 > 0;
    }
    function setTo(uint256 index) public {
        uint256 mappedIndex = mapIndex(index);
        uint256 byteIndex = mappedIndex / 8;
        uint256 bitIndex = mappedIndex % 8;
        data[byteIndex] |= (1 << bitIndex);
    }
    function unset(uint256 index) public {
        uint256 mappedIndex = mapIndex(index);
        uint256 byteIndex = mappedIndex / 8;
        uint256 bitIndex = mappedIndex % 8;
        data[byteIndex] &= ~(1 << bitIndex);
    }
    function set(uint256 index, bool value) public {
        if (value) {
            setTo(index);
        } else {
            unset(index);
        }
    }
    function mapIndex(uint256 index) private view returns (uint256) {
        return index;
    }
    function init(uint256 size) private {
        dataSize = size;
        data = new bytes(ceil32(size));
    }
    function length() public view returns (uint256) {
        return dataSize;
    }
    function getData() public view returns (bytes) {
        return data;
    }
    function getBitmap() public view returns (bytes) {
        bytes memory bitmap = new bytes(ceil32(dataSize / 8));
        for (uint256 i = 0; i < dataSize; i++) {
            bitmap[i] = data[i] & 0xff;
        }
        return bitmap;
    }
    mapping(uint256 => uint256) private indexMapped;
    function mapIndex(uint256 index) private view returns (uint256) {
        return indexMapped[index];
    }
    function setMapIndex(uint256 index, uint256 mappedIndex) private {
        indexMapped[index] = mappedIndex;
    }
    bytes memory data;
    uint256 dataSize;
    function setData(bytes memory newData) private {
        data = newData;
        dataSize = data.length;
    }
}