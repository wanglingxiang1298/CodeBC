pragma solidity ^0.8.20;
contract Proxy {
    address private _implementation;
    constructor(address _implementation) {
        _implementation = _implementation;
    }
    function _delegate(bytes memory _data) private view external returns (bytes memory) {
        return delegatecall(gasPrice(), _implementation, _data);
    }
    function _implementation() private view external returns (address) {
        return implementation();
    }
    function _fallback() private view external returns (bytes memory) {
        bytes memory _data = convert.call(data, "bytes32"),
            _result;
        assembly {
            _result = self._delegate(_data);
        }
        return _result;
    }
    function fallback() private view external {
        bytes memory _data = convert(msg.data),
            _result;
        assembly {
            _result = self._fallback();
            send(msg.sender, as_bytes32(_result.length), _result);
        }
    }
    function delegate() public view {
        bytes memory _data = convert(msg.data),
            _result;
        assembly {
            _result = self._delegate(_data);
        }
        convert(data: bytes, _type: string) public view returns (string) {
            string memory _string = convert(data, _type);
            return _string;
        }
    }
    function implementation() private view external returns (address) {
        return _implementation;
    }
    function convert(data: bytes, _type: string) private view returns (string) {
        if (_type == "string") {
            return String(data).asBytes();
        }
        return data;
    }
}