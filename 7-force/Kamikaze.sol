// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Kamikaze {
    address public beneficiary;
    address owner;

    constructor(address _address) {
        owner = msg.sender;
        beneficiary = _address;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "NOT_OWNER");
        _;
    }

    function donate() public payable {}

    function harakiri() public onlyOwner {
        selfdestruct(payable(beneficiary));
    }
}
