pragma solidity ^0.8.20;
contract ClashingImplementation {
    struct ClashingImplementationCall {
        address _to;
        bytes _data;
    }
    mapping(address => ClashingImplementationCall) public calls;
    function upgradeToAndCall(address _newAddress, bytes _data) external payable returns (bool) {
        require(msg.value >= msg.gas, "Not enough ether to upgrade contract");
        ClashingImplementationCall memory call = new ClashingImplementationCall();
        call._to = _newAddress;
        call._data = _data;
        calls[_msg.sender] = call;
        IERC721Upgradeable.upgradeToAndCall(_newAddress, _data);
        ClashingImplementationCall memory newCall = newClashingImplementationCall();
        emit ClashingImplementationCall(newCall);
        return true;
    }
    function delegatedFunction() public pure returns (bool) {
        return true;
    }
}