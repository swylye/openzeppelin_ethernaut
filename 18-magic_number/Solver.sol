// // SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MagicNum {
    address public solver;

    constructor() {}

    function setSolver(address _solver) public {
        solver = _solver;
    }
}

contract Solver {
    MagicNum magicNum;

    constructor(address _contractAdd) {
        magicNum = MagicNum(_contractAdd);
    }

    function solve() public {
        bytes
            memory bytecode = hex"600a600c600039600a6000f3602a60005260206000f3";
        bytes32 salt = 0;
        address solver;

        assembly {
            solver := create2(0, add(bytecode, 0x20), mload(bytecode), salt)
        }

        magicNum.setSolver(solver);
    }
}
