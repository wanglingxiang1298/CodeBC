pragma solidity ^0.8.20;
interface IBeacon {
    function implementation() external view returns (address);
}