pragma solidity ^0.8.20;
library Address {
    function sendValue(address payable recipient, uint256 amount) internal {
        require(address(this).balance >= amount, "Address: insufficient balance");
        (bool success, ) = recipient.call{value: amount}("");
        require(success, "Address: unable to send value, recipient may have reverted");
    }
    function functionCall(address target, bytes memory data) internal returns (bytes memory) {
        return target.call(data);
    }
    function functionCallWithValue(address target, uint256 value, bytes memory data) internal returns (bytes memory) {
        return target.call{value: value}(data);
    }
    function functionStaticCall(address target, bytes memory data) internal view returns (bytes memory) {
        return target.staticcall(data);
    }
    function functionDelegateCall(address target, bytes memory data) internal returns (bytes memory) {
        (bool success, bytes memory returndata) = target.delegatecall(data);
        require(success, "Address: delegate call failed");
        return returndata;
    }
    function _revert(bytes memory data) internal pure {
        revert(string(data));
    }
}
