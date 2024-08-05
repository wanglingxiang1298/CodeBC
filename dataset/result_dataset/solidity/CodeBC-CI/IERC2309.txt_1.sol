pragma solidity ^0.8.20;
interface IERC2309 {
    event ConsecutiveTransfer(
        address indexed _from,
        address indexed _to,
        uint256 _value
    );
}