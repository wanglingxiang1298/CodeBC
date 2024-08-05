pragma solidity ^0.8.20;
interface IAuthority {
    function canCall(
        address source,
        address target,
        bytes4 sig
    ) external view returns (bool);
}

