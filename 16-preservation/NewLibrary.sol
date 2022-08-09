// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract NewLibrary {
    address public add1;
    address public add2;
    address public owner;

    function setTime(uint256 _time) public {
        owner = address(_time);
    }

    function getUint(address _add) public pure returns (uint256) {
        uint256 res = uint256(_add);
        return res;
    }
}
