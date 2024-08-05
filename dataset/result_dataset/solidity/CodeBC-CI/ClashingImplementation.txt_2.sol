pragma solidity ^0.8.20;
contract ClashingImplementation {
    event ClashingImplementationCall(address indexed sender, address indexed to, uint256 value, bytes data);
    function upgradeToAndCall(address _to, bytes calldata _data) external payable {
        (bool success, ) = _to.call{value: msg.value}(_data);
        require(success, "ClashingImplementation: fallback call failed");
        emit ClashingImplementationCall(msg.sender, _to, msg.value, _data);
    }
}