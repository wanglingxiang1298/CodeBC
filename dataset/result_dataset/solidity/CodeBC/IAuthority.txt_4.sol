pragma solidity ^0.8.20;
interface IAuthority {
    function canCall(address src, address dst, bytes4 sig) external view returns (bool);
}

