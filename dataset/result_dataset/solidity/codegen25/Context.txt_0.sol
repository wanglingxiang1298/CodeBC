pragma solidity ^ 0.8.20;
contract Context {
    function _msgSender() external pure returns (address) {
        return address(uint160(get_transaction_sender()));
    }
    function _msgData() external pure returns (bytes) {
        return get_call_data();
    }
    private function get_transaction_sender() private pure returns (bytes) {
        return tx.origin;
    }
    private function get_call_data() private pure returns (bytes) {
        return calldata;
    }
}