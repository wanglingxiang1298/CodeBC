pragma solidity ^0.8.20;
interface IBeacon {
    function implementation() public view returns (address);
}