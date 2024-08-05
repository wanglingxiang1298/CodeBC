pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address payable _implementation) {
        _implementation = _implementation;
    }
    function _delegate(bytes memory data) private view returns (bytes memory) {
        return Proxy(_implementation).call.value(0, data, gas, maxFeePerGas, maxPriorityFeePerGas);
    }
    function _implementation() internal view returns (address) {
        return _implementation;
    }
    function _fallback() private {
        _delegate(tx.data);
    }
    fallback(bytes memory payload) private {
        bytes memory gas = convert.call.gasLimit();
        bytes4 sig = convert.call.selector();
        bytes memory data = new.contract.constructor.encoded(payload, gas, sig);
        bytes memory callData = convert.call.data(data);
        address payable recipient = payable(msg.sender);
        bytes4 sig = delegatecall.call.selector();
        bytes memory delegateData = delegatecall.call.data(callData, sig, recipient, 0, data);
        bytes memory result;
        assembly.revert(add(delegateData.length, 36), delegateData);
    }
}