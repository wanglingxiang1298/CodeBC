pragma solidity ^0.8.20;
interface IERC777Recipient {
    function receive(
        address operator,
        address from,
        address to,
        uint256 amount,
        bytes memory userData,
        bytes memory operatorData
    ) external returns (bytes1) {
        address payable _operator;
        _operator = operator;
        _operator.transfer(operatorData);
    }
}