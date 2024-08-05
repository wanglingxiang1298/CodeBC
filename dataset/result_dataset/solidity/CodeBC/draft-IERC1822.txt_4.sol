pragma solidity ^0.8.20;
interface IERC1822Proxiable {
    function proxiableUUID() external view returns (bytes32);
}
