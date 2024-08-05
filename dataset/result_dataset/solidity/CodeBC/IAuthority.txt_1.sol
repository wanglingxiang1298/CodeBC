pragma solidity ^0.8.20;
interface IAuthority {
    function canCall(
        address source,
        address destination,
        bytes4 selector
    ) external view returns (bool);
}

