// SPDX-License-Identifier: MIT

// solidity version has been modifier to a newer one
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract GatekeeperOne {
    using SafeMath for uint256;
    address public entrant;

    // This has been added to convert tx.origin into uint256 so that it can later on be typecasted into uint16
    uint256 addressUint = uint256(uint160(address(tx.origin)));

    modifier gateOne() {
        require(msg.sender != tx.origin);
        _;
    }

    modifier gateTwo() {
        require(gasleft().mod(8191) == 0);
        _;
    }

    modifier gateThree(bytes8 _gateKey) {
        require(
            uint32(uint64(_gateKey)) == uint16(uint64(_gateKey)),
            "GatekeeperOne: invalid gateThree part one"
        );
        require(
            uint32(uint64(_gateKey)) != uint64(_gateKey),
            "GatekeeperOne: invalid gateThree part two"
        );
        require(
            // instead of using tx.origin directly, we're using the variable that we've converted into uin256
            uint32(uint64(_gateKey)) == uint16(addressUint),
            "GatekeeperOne: invalid gateThree part three"
        );
        _;
    }

    function enter(bytes8 _gateKey)
        public
        gateOne
        gateTwo
        gateThree(_gateKey)
        returns (bool)
    {
        entrant = tx.origin;
        return true;
    }
}
