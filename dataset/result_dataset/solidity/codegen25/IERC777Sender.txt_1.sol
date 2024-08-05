pragma solidity ^0.8.20;
interface IERC777Sender {
    function send(address _to, uint256 _value, bytes memory _data) external;
}