## Solution requires a combination of browser + deploying a contract
1. Deploy the DenialAttacked contract onto Rinkeby
2. Set the address of the contract deployed above as a partner

Some points to understant:
- 3 ways to send ether: transfer, send and call
---> both transfer and send would only send 2300 gas, for call (if not specified, it'll send all)
- 3 ways to trigger error in solidity: assert, revert, require
---> For both revert and require, the contract would return remaining gas. However for assert (on solidity 0.6), it'll not return any of the gas.
---> Therefore, we'd want to use assert so that any remaining transactions after the attempting to transfer ether to partner would fail