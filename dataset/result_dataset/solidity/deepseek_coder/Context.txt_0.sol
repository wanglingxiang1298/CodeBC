pragma solidity ^ 0.8.20;
contract Context {
    function _msgSender() internal view returns (address) {
        return address(uint160(getcallvalue(this)));
    }
    function _msgData() internal view returns (bytes) {
        return calldata();
    }
}