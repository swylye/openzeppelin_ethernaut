## Solution Overview
1. Looking at the contract code, we'd want to trigger the fallback function in the delegation contract
2. This would in turn do a delegatecall to the delegate contract
3. The delegate contract function called would depend on the msg.data we pass in
4. Looking at the data storage structures, since owner address is in slot 0 for both contracts, by delegate calling the pwn function in the delegate contract from delegation, we'd be able to alter the owner address for delegation contract. Since delegate call would run the logic from another contract but the data altered would be on the calling contract.

## Code
```
const pwnSignature = web3.utils.sha3("pwn()")
await contract.sendTransaction({data: pwnSignature})
```