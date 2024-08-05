pragma solidity ^0.8.20;
interface IERC777Sender {
    function send(
        address _operator,
        address _from,
        address _to,
        uint256 _amount,
        bytes _userData,
        bytes _operatorData
    ) external returns (bytes);
}